<template>
    <admin-layout>
        <el-row class="mb-3">
            <router-link :to="{ name: 'admin.media' }">
                <el-button type="success">All media</el-button>
            </router-link>
        </el-row>
        <h3 class="form__title">Create media</h3>
        <el-form label-width="120px">
            <el-row :gutter="20">
                <el-col :span="6">
                    <el-form-item label="Photo">
                        <input type="file" ref="files" @change="choose_file" multiple/>
                        <ul>
                            <li v-for="(image, index) in images" :key="index">
                                <span>{{ image.name }}</span>
                            </li>
                        </ul>
                    </el-form-item>
                </el-col>
            </el-row>

            <el-row>
                <el-col :span="6">
                    <el-form-item>
                        <el-button type="primary" @click.prevent="onSubmit">Add</el-button>
                    </el-form-item>
                </el-col>
            </el-row>
        </el-form>
    </admin-layout>
</template>
<script>
import AdminLayout from "../../layouts/AdminLayout.vue";
import FormComponent from "../../components/FormComponent.vue";

export default {
    data() {
        return {
            images: [],
            errors: {},
        };
    },
    components: {
        AdminLayout,
        FormComponent,
    },
    methods: {
        choose_file() {
            for (let i = 0; i < this.$refs.files.files.length; i++) {
                this.images.push(this.$refs.files.files[i]);
            }
        },
        onSubmit() {
            let formData = new FormData();
            for (let i = 0; i < this.images.length; i++) {
                formData.append(`files[${i}]`, this.images[i]);
            }
            axios
                .post(
                    "/api/media",
                    formData
                )
                .then((res) => {
                    this.images = [];
                    this.$refs.files.value = "";
                    //   console.log(res.data, "res");
                    this.$router.push({name: "admin.media"});
                })
                .catch((error) => {
                    this.errors = error.response;
                    this.$notify({
                        type: "error",
                        message: this.errors.data.message,
                    });
                });
        },
    },
};
</script>
