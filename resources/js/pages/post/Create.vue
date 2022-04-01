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
                            <el-select v-model="form.category" placeholder="Select">
                                <el-option
                                    v-for="item in categories"
                                    :key="item.id"
                                    :label="item.title"
                                    :value="item.id">
                                </el-option>
                            </el-select>
                        </el-form-item>
                        <small class="form--error" v-if="errors && errors.category_id">{{ errors.category_id[0] }}</small>
                    </el-col>

                    <el-col :span="6">
                        <el-form-item label="Image">
                            <el-button type="primary" @click="showMediaGrid = true"
                            >Add image
                            </el-button
                            >
                            <images-thumbs :images="form.images"></images-thumbs>
                        </el-form-item>
                        <small class="form--error" v-if="errors && errors.image">{{
                                errors.image[0]
                            }}</small>
                    </el-col>
                </el-row>
                <el-row>
                    <el-form-item label="Text">
                        <div class="form-block__editor">
                            <m-editor
                                v-model="form.text"
                                :debounce="true"
                                :debounce-wait="500"
                                theme="dark"
                                @on-change="handleChange"
                            />
                            <!--                        <div class="m-editor-preview" v-html="markdownContent"></div>-->
                        </div>
                        <small class="form--error" v-if="errors && errors.text">{{ errors.text[0] }}</small>
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
        <media-grid
            @emit_images="emit_images"
            @handler="showMediaGrid = false"
            v-if="showMediaGrid"
            :single="false"
        />
    </admin-layout>
</template>
<script>
import FormBlock from "../../components/FormBlock";
import AdminLayout from "../../layouts/AdminLayout.vue";
import FormComponent from "../../components/FormComponent.vue";
import mEditor from 'simple-m-editor'
import MediaGrid from "../../components/admin/MediaGrid";
import ImagesThumbs from "../../components/admin/ImagesThumbs";
import 'simple-m-editor/dist/simple-m-editor.css'

export default {
    data() {
        return {
            form: {
                title: "",
                slug: "",
                text: '',
                image: "",
                category_id: ""
            },
            errors: {},
            markdownContent: '',
            categories: [],
            showMediaGrid: false,
        };
    },
    components: {
        mEditor,
        FormBlock,
        AdminLayout,
        FormComponent,
        MediaGrid,
        ImagesThumbs
    },
    methods: {
        emit_images(images) {
            this.form.images = images;
            this.form.image = this.form.images[0];
        },
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
                    this.$router.push({name: "admin.category_id"});
                })
                .catch((error) => {
                    this.errors = error.response.data.errors;
                });
        },
    },
    mounted() {
        axios.get("/api/category_id").then(res => {
            this.categories = res.data.data;
        }).catch(error => console.log(error, 'error'));
    }
};
</script>
