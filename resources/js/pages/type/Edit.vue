<template>
    <admin-layout>
        <el-row class="mb-3">
            <router-link :to="{ name: 'admin.type' }">
                <el-button type="success">All types</el-button>
            </router-link>
        </el-row>
        <form-block title="New type">
            <el-form ref="form" :model="form" label-width="120px">
                <el-row :gutter="20">
                    <el-col :span="6">
                        <el-form-item label="Title">
                            <el-input v-model="form.title"></el-input>
                            <small class="form--error" v-if="errors && errors.title">{{
                                    errors.title[0]
                                }}</small>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="6">
                        <el-form-item>
                            <el-button type="success" @click.prevent="onSubmit"
                            >Create
                            </el-button>
                        </el-form-item>
                    </el-col>
                </el-row>
            </el-form>
        </form-block>
    </admin-layout>
</template>
<script>
import FormBlock from "../../components/FormBlock";
import AdminLayout from "../../layouts/AdminLayout.vue";
import FormComponent from "../../components/FormComponent.vue";

export default {
    data() {
        return {
            form: {
                title: "",
            },
            errors: {},
        };
    },
    components: {
        FormBlock,
        AdminLayout,
        FormComponent,
    },
    methods: {
        onSubmit() {
            axios
                .put("/api/type/" + this.$route.params.id, this.form)
                .then((res) => {
                    this.$notify({
                        type: "success",
                        message: "Post was created",
                    });
                    this.$router.push({name: "admin.type"});
                })
                .catch((error) => {
                    this.errors = error.response.data.errors;
                });
        },
    },
    mounted() {
        axios
            .get("/api/type/" + this.$route.params.id)
            .then((res) => {
                this.form = res.data.data;
            })
            .catch((error) => {
                this.errors = error.response.data.errors;
            });
    }
};
</script>
