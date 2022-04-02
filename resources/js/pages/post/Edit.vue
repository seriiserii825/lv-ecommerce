<template>
    <admin-layout>
        <el-row class="mb-3">
            <router-link :to="{ name: 'admin.post' }">
                <el-button type="success">All posts</el-button>
            </router-link>
        </el-row>
        <form-block title="New post">
            <el-form ref="form" :model="form" label-width="120px">
                <el-row :gutter="20">
                    <el-col :span="6">
                        <el-form-item label="Title">
                            <el-input @change="titleChange" v-model="form.title"></el-input>
                            <small class="form--error" v-if="errors && errors.title">{{ errors.title[0] }}</small>
                        </el-form-item>
                    </el-col>
                    <el-col :span="6">
                        <el-form-item label="Slug">
                            <el-input v-model="form.slug"></el-input>
                            <small class="form--error" v-if="errors && errors.slug">{{ errors.slug[0] }}</small>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="6">
                        <el-form-item label="Category">
                            <el-select v-model="form.category_id" placeholder="Select">
                                <el-option
                                    v-for="item in categories"
                                    :key="item.id"
                                    :label="item.title"
                                    :value="item.id">
                                </el-option>
                            </el-select>
                        </el-form-item>
                        <small class="form--error" v-if="errors && errors.category_id">{{
                                errors.category_id[0]
                            }}</small>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="12">
                        <el-form-item label="Text">
                            <mavon-editor v-model="form.text" language="en" codeStyle="stackoverflow-dark"/>
                            <small class="form--error" v-if="errors && errors.text">{{ errors.text[0] }}</small>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="6">
                        <el-form-item>
                            <el-button type="success" @click.prevent="onSubmit" >Update </el-button>
                        </el-form-item>
                    </el-col>
                </el-row>
            </el-form>
        </form-block>
    </admin-layout>
</template>
<script>
import {mavonEditor} from 'mavon-editor'
import 'mavon-editor/dist/css/index.css'
import FormBlock from "../../components/FormBlock";
import AdminLayout from "../../layouts/AdminLayout.vue";
import FormComponent from "../../components/FormComponent.vue";
import MediaGrid from "../../components/admin/MediaGrid";
import ImagesThumbs from "../../components/admin/ImagesThumbs";

export default {
    data() {
        return {
            form: {
                title: "",
                slug: "",
                text: '',
                category_id: ""
            },
            errors: {},
            categories: [],
        };
    },
    components: {
        FormBlock,
        AdminLayout,
        FormComponent,
        MediaGrid,
        ImagesThumbs,
        mavonEditor
    },
    methods: {
        titleChange() {
            const title = this.form.title.toLowerCase();
            this.form.slug = title.replace(/ /, '-');
        },
        onSubmit() {
            axios
                .put("/api/post/"+this.$route.params.id, this.form)
                .then((res) => {
                    this.$notify({
                        type: "success",
                        message: "Post was created",
                    });
                    this.$router.push({name: "admin.post"});
                })
                .catch((error) => {
                    this.errors = error.response.data.errors;
                });
        },
        getPost() {
            axios.get("/api/post/" + this.$route.params.id).then(res => {
                console.log(JSON.stringify(res.data.data, null, 4));
                this.form = res.data.data;
            }).catch(error => console.log(error, 'error'));
        }
    },
    mounted() {
        this.getPost();
        axios.get("/api/category").then(res => {
            this.categories = res.data.data;
        }).catch(error => console.log(error, 'error'));
    }
};
</script>
