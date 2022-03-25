<template>
    <front-layout>
        <div class="login">
            <h2 class="login__title">Register</h2>
            <el-form label-width="120px">
                <el-form-item label="Name">
                    <el-input name="name" v-model="form.name"></el-input>
                    <p v-if="this.errors && this.errors.name" class="error">
                        {{ this.errors.name[0] }}
                    </p>
                </el-form-item>
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
    </front-layout>
</template>
<script>
import FrontLayout from "../layouts/FrontLayout.vue";

export default {
    data() {
        return {
            form: {
                email: "",
                password: "",
                name: ""
            },
            errors: {},
        };
    },
    methods: {
        onSubmit() {
            axios.post("/api/register", this.form).then(res => {
                console.log(res, 'res')
                this.$router.push({name: "login"});
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
        },
    },
    components: {
        FrontLayout,
    },
};
</script>
<style lang="scss">
.login {
    margin: 0 auto;
    max-width: 50rem;
    &__title {
        margin: 4rem;
        text-align: center;
    }
}
</style>
