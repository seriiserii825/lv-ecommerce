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
                            <small class="form--error" v-if="errors && errors.title">{{
                                    errors.title[0]
                                }}</small>
                        </el-form-item>
                    </el-col>
                    <el-col :span="6">
                        <el-form-item label="Slug">
                            <el-input v-model="form.slug"></el-input>
                            <small class="form--error" v-if="errors && errors.slug">{{
                                    errors.slug[0]
                                }}</small>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-form-item label="Category">
                        <el-select v-model="form.category" placeholder="Select">
                            <el-option
                                v-for="item in categories"
                                :key="item.id"
                                :label="item.title"
                                :value="item.id">
                            </el-option>
                        </el-select>
                    </el-form-item>
                </el-row>
                <el-row>
                    <el-form-item label="Text">
                        <div class="form-block__editor">
                            <m-editor
                                v-model="text"
                                :debounce="true"
                                :debounce-wait="500"
                                theme="dark"
                                @on-change="handleChange"
                            />
                            <!--                        <div class="m-editor-preview" v-html="markdownContent"></div>-->
                        </div>
                    </el-form-item>
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
import mEditor from 'simple-m-editor'
import 'simple-m-editor/dist/simple-m-editor.css'

export default {
    data() {
        return {
            form: {
                title: "",
                slug: "",
                image: "",
                category: ""
            },
            errors: {},
            text: '',
            markdownContent: '',
            categories: [],
        };
    },
    components: {
        mEditor,
        FormBlock,
        AdminLayout,
        FormComponent,
    },
    methods: {
        handleChange(data) {
            this.markdownContent = data.htmlContent
        },
        titleChange() {
            const title = this.form.title.toLowerCase();
            this.form.slug = title.replace(/ /, '-');
        },
        onSubmit() {
            axios
                .post("/api/post", this.form)
                .then((res) => {
                    this.$notify({
                        type: "success",
                        message: "Post was created",
                    });
                    this.$router.push({name: "admin.category"});
                })
                .catch((error) => {
                    this.errors = error.response.data.errors;
                });
        },
    },
    mounted() {
        axios.get("/api/category").then(res => {
            this.categories = res.data.data;
            this.form.category = this.categories[0].title;
        }).catch(error => console.log(error, 'error'));
    }
};
</script>
