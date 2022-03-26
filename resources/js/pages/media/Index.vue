<template>
    <admin-layout>
        <el-row class="mb-3">
            <el-col :span="4">
                <router-link :to="{ name: 'admin.media.create' }">
                    <el-button type="success">Create</el-button>
                </router-link>
            </el-col>
            <el-col :span="4">
                <input
                    class="admin-layout__search"
                    v-model="search"
                    @input="searchInput"
                    type="text"
                    placeholder="Search media...."
                />
            </el-col>
        </el-row>
        <h2 class="admin-layout__title">List media</h2>
        <ul class="media-list">
            <li v-for="item in searchedItems" :key="item.id">
                <img :src="item.path" alt=""/>
                <h3 class="media-list__title">{{ shortTitle(item.title) }}</h3>
                <a class="media-list__delete" href="#" @click.prevent="remove(item.id)"
                ><i class="el-icon-error"></i>
                </a>
            </li>
        </ul>
    </admin-layout>
</template>
<script>
import axios from "axios";
import AdminLayout from "./../../layouts/AdminLayout.vue";

export default {
    data() {
        return {
            items: [],
            fullscreenLoading: false,
            search: "",
            searchedItems: [],
        };
    },
    components: {
        AdminLayout,
    },
    methods: {
        searchInput() {
            if (this.search.length > 0) {
                this.searchedItems = this.searchedItems.filter((item) => {
                    return item.title.includes(this.search);
                });
            } else {
                this.searchedItems = this.items;
            }
        },
        shortTitle(title) {
            if (title.length > 20) {
                title = title.slice(0, 20) + "..." + title.slice(-4);
                return title;
            }
            return title;
        },
        remove(id) {
            this.$confirm("This will permanently delete. Continue?", "Warning", {
                    confirmButtonText: "OK",
                    cancelButtonText: "Cancel",
                    type: "warning",
                })
                .then(() => {
                    axios
                        .delete("/api/media/" + id)
                        .then((res) => {
                            this.getItems();
                        })
                        .catch((error) => {
                            this.errors = error.response.data.errors;
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
                .get("/api/media")
                .then((res) => {
                    this.items = res.data.data;
                    this.searchedItems = this.items;
                })
                .catch((error) => {
                    this.errors = error.response.data.errors;
                });
        },
    },
    created() {
        this.getItems();
    },
};
</script>
<style lang="scss">
.media-list {
    display: flex;
    justify-content: flex-start;
    flex-wrap: wrap;
    margin: 0;
    padding: 0;
    width: 100%;
    list-style-type: none;
    li {
        position: relative;
        margin-bottom: 2rem;
        margin-right: 2rem;
        width: 18rem;
        height: 12rem;
        background-color: white;
        border: 1px solid #ccc;
        box-shadow: 0 0 6px 2px rgba(0, 0, 0, 0.2);
        &:hover {
            .media-list__delete {
                opacity: 1;
            }
        }
        img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: 1;
        }
    }
    &__title {
        position: absolute;
        bottom: 0;
        left: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 0 2rem;
        width: 100%;
        height: 4rem;
        font-size: 1.4rem;
        text-align: center;
        color: black;
        background-color: white;
        z-index: 2;
    }
    &__delete {
        position: absolute;
        top: 0;
        right: 0;
        width: 100%;
        height: 100%;
        font-size: 6rem;
        color: red;
        background-color: rgba(255, 255, 255, 0.5);
        z-index: 3;
        opacity: 0;
        transition: all 0.4s;
        i {
            position: absolute;
            top: 25%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: inline-block;
            width: 25%;
            height: 30%;
        }
    }
}
</style>
