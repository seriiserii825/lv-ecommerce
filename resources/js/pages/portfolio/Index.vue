<template>
    <admin-layout>
        <el-row class="mb-3">
            <router-link :to="{ name: 'admin.portfolio.create' }">
                <el-button type="success">Create</el-button>
            </router-link>
        </el-row>
        <admin-table>
            <table>
                <thead>
                <tr>
                    <th>
                        <table-sort-header
                            title="Id"
                            table_column="id"
                            @sort_table="sort_table"
                            :sort_field="sort_field"
                            :sort_direction="sort_direction"
                        ></table-sort-header>
                    </th>
                    <th>Image</th>
                    <th>
                        <table-sort-header
                            title="Title"
                            table_column="title"
                            @sort_table="sort_table"
                            :sort_field="sort_field"
                            :sort_direction="sort_direction"
                        ></table-sort-header>
                    </th>
                    <th style="width: 20rem;">Domain</th>
                    <th>Type</th>
                    <th>Date</th>
                    <th>Created At</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="item in items" :key="item.id">
                    <td>{{ item.id }}</td>
                    <td><img width="150" height="100" :src="item.image" alt=""></td>
                    <td><h3>{{ item.title }}</h3></td>
                    <td><a target="_blank" :href="item.domain">{{ item.domain }}</a></td>
                    <td>{{ item.type.title }}</td>
                    <td>{{ fDate(item.date) }}</td>
                    <td>{{ fDate(item.created_at) }}</td>
                    <td>
                        <div class="admin-table__actions">
                            <router-link
                                :to="{ name: 'admin.portfolio.edit', params: { id: item.id } }"
                            >
                                <el-button type="primary">Edit</el-button>
                            </router-link>
                            <el-button type="danger" @click="remove(item.id)"
                            >Delete
                            </el-button
                            >
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </admin-table>
    </admin-layout>
</template>
<script>
import axios from "axios";
import TableSortHeader from "../../components/admin/TableSortHeader";
import FormBlock from "../../components/FormBlock";
import AdminLayout from "./../../layouts/AdminLayout.vue";
import AdminTable from "../../components/admin/AdminTable.vue";

export default {
    data() {
        return {
            items: [],
            fullscreenLoading: false,
            sort_field: "created_at",
            sort_direction: "desc",
        };
    },
    components: {
        TableSortHeader,
        FormBlock,
        AdminLayout,
        AdminTable,
    },
    methods: {
        sort_table(field) {
            if (this.sort_field === field) {
                this.sort_direction = this.sort_direction === "asc" ? "desc" : "asc";
            } else {
                this.sort_field = field;
                this.sort_direction = "asc";
            }
            this.getItems();
        },
        getItems() {
            axios.get("/api/portfolio/" + "?sort_field=" + this.sort_field + "&sort_direction=" + this.sort_direction)
                .then((res) => {
                    this.items = res.data.data;
                })
                .catch((error) => {
                    console.log(error, "error");
                });
        },
        remove(id) {
            this.$confirm("This will permanently delete. Continue?", "Warning", {
                    confirmButtonText: "OK",
                    cancelButtonText: "Cancel",
                    type: "warning",
                })
                .then(() => {
                    axios
                        .delete("/api/portfolio/" + id)
                        .then((res) => {
                            this.getItems();
                        })
                        .catch((error) => {
                            this.errors = error.response.data.errors;
                            // this.form_submitting = false;
                        });
                    this.$notify({
                        type: "success",
                        message: "Delete completed",
                    });
                })
                .catch(() => {
                    this.$notify({
                        type: "info",
                        message: "Delete canceled",
                    });
                });
        },
        fDate(value) {
            let date = new Date(value)
            return new Intl.DateTimeFormat('en-GB', {
                year: "numeric",
                month: "short",
                day: "2-digit"
            }).format(date).split(" ").join("-");
        }
    },
    created() {
        this.getItems();
        // axios
        //     .get("/api/csv")
        //     .then((res) => {
        //         const result = res.data.insert_data;
        //         console.log(result, 'result')
        //         // result.forEach(item => {
        //         //     console.log(JSON.stringify(item, null, 4));
        //         // });
        //     })
        //     .catch((error) => {
        //         console.log(error, "error");
        //     });
    },
};
</script>
