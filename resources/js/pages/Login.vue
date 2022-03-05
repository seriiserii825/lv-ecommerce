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
    async onSubmit() {
      await this.$store.dispatch("login", this.form);
      this.$notify({
        type: "success",
        message: "Success logged in",
      });

      this.$router.push({ name: "admin.index" });
      window.location = window.location.href;
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