<template>
    <admin-layout>
        <el-row class="mb-3">
            <router-link :to="{ name: 'admin.portfolio' }">
                <el-button type="success">All portfolios</el-button>
            </router-link>
        </el-row>
        <form-block title="New portfolio">
            <el-form ref="form" :model="form" label-width="120px">
                <el-row :gutter="20">
                    <el-col :span="6">
                        <el-form-item label="Title">
                            <el-input v-model="form.title"></el-input>
                            <small class="form--error" v-if="errors && errors.title">{{ errors.title[0] }}</small>
                        </el-form-item>
                    </el-col>
                    <el-col :span="6">
                        <el-form-item label="Domain">
                            <el-input v-model="form.domain"></el-input>
                            <small class="form--error" v-if="errors && errors.domain">{{ errors.domain[0] }}</small>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="6">
                        <el-form-item label="Type">
                            <el-select v-model="form.type_id" placeholder="Select">
                                <el-option
                                    v-for="item in types"
                                    :key="item.id"
                                    :label="item.title"
                                    :value="item.id">
                                </el-option>
                            </el-select>
                        </el-form-item>
                        <small class="form--error" v-if="errors && errors.type_id">{{ errors.type_id[0] }}</small>
                    </el-col>

                    <el-col :span="6">
                        <el-form-item label="Date">
                            <el-date-picker
                                v-model="form.date"
                                type="datetime"
                                placeholder="Select date and time">
                            </el-date-picker>
                        </el-form-item>
                        <small class="form--error" v-if="errors && errors.date">{{
                                errors.date[0]
                            }}</small>
                    </el-col>
                </el-row>
                <el-row>
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
                    <el-col :span="6">
                        <el-form-item>
                            <el-button type="success" @click.prevent="onSubmit">Update</el-button>
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
import MediaGrid from "../../components/admin/MediaGrid";
import ImagesThumbs from "../../components/admin/ImagesThumbs";

export default {
    data() {
        return {
            form: {
                title: "",
                domain: "",
                image: "",
                images: [],
                type_id: "",
                date: ""
            },
            errors: {},
            types: [],
            showMediaGrid: false,
        };
    },
    components: {
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
        onSubmit() {
            axios
                .put("/api/portfolio/"+this.$route.params.id, this.form)
                .then((res) => {
                    this.$notify({
                        type: "success",
                        message: "Portfolio was updated",
                    });
                    this.$router.push({name: "admin.portfolio"});
                })
                .catch((error) => {
                    this.errors = error.response.data.errors;
                });
        },
        getType() {
            axios.get("/api/type").then(res => {
                this.types = res.data.data;
            }).catch(error => console.log(error, 'error'));
        },
        getPortfolio() {
            axios
                .get("/api/portfolio/" + this.$route.params.id)
                .then((res) => {
                    this.form = res.data.data;
                })
                .catch((error) => {
                    this.errors = error.response.data.errors;
                });
        }
    },
    mounted() {
        this.getType();
        this.getPortfolio();
    }
};
</script>
