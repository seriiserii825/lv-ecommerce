<template>
    <div class="login">
        <div class="login__form">
            <h2 class="login__title">Login</h2>
            <el-form label-width="120px">
                <el-form-item label="Login">
                    <el-input name="email" v-model="form.email"></el-input>
                    <p v-if="this.errors && this.errors.email" class="error">
                        {{ this.errors.email[0] }}
                    </p>
                </el-form-item>
                <el-form-item label="Password">
                    <el-input name="password" v-model="form.password"></el-input>
                    <p v-if="this.errors && this.errors.password" class="error">
                        {{ this.errors.password[0] }}
                    </p>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click.prevent="onSubmit">Login</el-button>
                </el-form-item>
            </el-form>
        </div>
    </div>
</template>
<script>
import FrontLayout from "../layouts/FrontLayout.vue";

export default {
    data() {
        return {
            form: {
                email: "",
                password: "",
            },
            errors: {},
        };
    },
    methods: {
        onSubmit() {
            axios.get('/sanctum/csrf-cookie').then(response => {
                axios.post("/login", this.form).then(res => {
                    this.$router.push({name: 'admin.index'});
                }).catch(error => {
                    const error_data = error.response.data;
                    if (error_data.message) {
                        this.$notify({
                            type: "error",
                            message: error_data.message
                        });
                    }
                    this.errors = error_data.errors;
                });
            });
        },
    },
    components: {
        FrontLayout,
    },
};
</script>
<style lang="scss">
.login {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    &__form {
        padding: 4rem;
        width: 40rem;
        background-color: #fff;
        box-shadow: 0 3px 8px -3px rgba(0, 0, 0, .2);
        border-radius: 1rem;
        overflow: hidden;
    }
    &__title {
        margin-bottom: 2rem;
        text-align: center;
    }
}
</style>
