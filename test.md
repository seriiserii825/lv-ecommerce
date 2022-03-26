## install sanctum

```
composer require laravel/sanctum
```

## publish configuration

```
php artisan vendor:publish --provider="Laravel\Sanctum\SanctumServiceProvider"
```

## run db migrations

```
php artisan migrate
```

## app/Http/Kernel.php

```
'api' => [
    \Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful::class,
    'throttle:api',
    \Illuminate\Routing\Middleware\SubstituteBindings::class,
],
```

## add trait in User model

```
use Laravel\Sanctum\HasApiTokens;
```

## create routes

### Routes for login and register will be created automaticaly

```
Route::group(["middleware" => "auth:sanctum"], function () {
    Route::get("/admin", [AdminController::class, "index"]);
    Route::resource('user', "App\Http\Controllers\Api\UserController");
});
```

## login vue

```
<template>
    <front-layout>
        <div class="login">
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
    margin: 0 auto;
    max-width: 50rem;
    &__title {
        margin: 4rem;
        text-align: center;
    }
}
</style>
```
