<template>
  <div>
    <el-menu
      :default-active="activeIndex"
      class="el-menu-demo front-menu"
      mode="horizontal"
    >
      <el-menu-item index="1">
        <router-link class="front-menu__link" :to="{ name: 'home' }"
          >Home</router-link
        >
      </el-menu-item>
      <el-menu-item v-if="is_auth" index="2">
        <router-link class="front-menu__link" :to="{ name: 'admin.index' }"
          >Admin</router-link
        >
      </el-menu-item>
      <el-menu-item v-if="!is_auth" index="3">
        <router-link class="front-menu__link" :to="{ name: 'login' }"
          >Login</router-link
        >
      </el-menu-item>
      <el-menu-item v-if="!is_auth" index="4">
        <router-link class="front-menu__link" :to="{ name: 'register' }"
          >Register</router-link
        >
      </el-menu-item>
      <el-menu-item v-if="is_auth" index="5">
        <a class="front-menu__link" @click.prevent="logout" href="#">Logout</a>
      </el-menu-item>
    </el-menu>
    <slot></slot>
  </div>
</template>
<script>
export default {
  data() {
    return {
      activeIndex: "1",
    };
  },
  computed: {
    is_auth() {
      return this.$store.getters.isAuthenticated;
    },
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    },
    logout() {
      axios.post("/logout").then((res) => {
        this.$store.dispatch("logout");
        this.$notify({
          type: "success",
          message: "Success logout",
        });
        this.$router.push({ name: "login" });
        window.location = window.location.href;
      });
    },
  },
};
</script>
<style lang="scss">
@import "@/_variables";
.el-menu {
  margin-bottom: 5rem;
}
.front-menu {
  display: flex;
  justify-content: flex-end;
  background-color: $color_1;
  li {
    padding: 0 !important;
    height: auto !important;
    border: 0 !important;
  }
  &__link {
    display: block;
    padding: 0 3rem;
    font-weight: bold;
    text-decoration: none;
    text-transform: uppercase;
    text-decoration: none;
    color: white !important;
    transition: all 0.4s;
    &:hover {
      background-color: $color_2 !important;
    }
    &.router-link-exact-active {
      background-color: $color_2;
    }
  }
}
</style>
