<template>
  <admin-layout>
    <el-row class="mb-3">
      <router-link :to="{ name: 'admin.category.create' }">
        <el-button type="success">Create</el-button>
      </router-link>
    </el-row>
    <admin-table>
      <table>
        <thead>
          <tr>
            <th>Id</th>
            <th>Title</th>
            <th>Slug</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="item in items" :key="item.id">
            <td>{{ item.id }}</td>
            <td>{{ item.title }}</td>
            <td>{{ item.slug }}</td>
            <td>
              <div class="admin-table__actions">
                <router-link
                  :to="{ name: 'admin.category.edit', params: { id: item.id } }"
                >
                  <el-button type="primary">Edit</el-button>
                </router-link>
                <el-button type="danger" @click="remove(item.id)"
                  >Delete</el-button
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
import FormBlock from "../../components/FormBlock";
import AdminLayout from "./../../layouts/AdminLayout.vue";
import AdminTable from "../../components/admin/AdminTable.vue";

export default {
  data() {
    return {
      items: [],
      fullscreenLoading: false,
    };
  },
  components: {
    FormBlock,
    AdminLayout,
    AdminTable,
  },
  methods: {
    remove(id) {
      this.$confirm("This will permanently delete. Continue?", "Warning", {
        confirmButtonText: "OK",
        cancelButtonText: "Cancel",
        type: "warning",
      })
        .then(() => {
          axios
            .delete("/api/category/" + id)
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
    getItems() {
      axios
        .get("/api/category")
        .then((res) => {
          this.items = res.data.data;
        })
        .catch((error) => {
          console.log(error, "error");
        });
    },
  },
  created() {
    this.getItems();
  },
};
</script>
