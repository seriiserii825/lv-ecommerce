<template>
  <div class="header-admin">
    <el-menu class="el-menu-demo main-menu" mode="horizontal">
      <el-menu-item index="1">
        <router-link class="main-menu__link" :to="{ name: 'admin.index' }">
          <el-button type="success">List media</el-button>
        </router-link>
      </el-menu-item>
      <el-menu-item index="2">
        <router-link class="main-menu__link" :to="{ name: 'admin.index' }">
          <el-button type="primary">Add media</el-button>
        </router-link>
      </el-menu-item>
    </el-menu>
    <el-menu class="el-menu-demo main-menu" mode="horizontal">
      <el-menu-item index="1">
        <router-link class="header-admin__link" :to="{ name: 'home' }">
          <i class="el-icon-s-home"></i>
          <span>Home</span>
        </router-link>
      </el-menu-item>
      <el-menu-item index="2">
        <a @click.prevent="logout" href="#">Logout</a>
      </el-menu-item>
    </el-menu>
  </div>
</template>
<script>
export default {
  data() {
    return {};
  },
  methods: {
    logout() {
      axios.post("/logout").then((res) => {
        this.$notify({
          type: "success",
          message: "Success logout",
        });
        this.$router.push({ name: "login" });
      });
    },
  },
};
</script>
<style lang="scss">
.el-header {
  text-align: right;
  &__title {
    font-size: 1.7rem;
  }
}

.header-admin {
  display: flex;
  justify-content: space-between;
  margin-bottom: 0 !important;
  background-color: #333;
  border: none !important;
  .el-menu {
    margin-bottom: 0;
    background: transparent;
  }
  .el-menu-item {
    border: 0;
  }
  &__link {
    display: flex;
    align-items: center;
    text-decoration: none;
    &:hover {
      text-decoration: none;
      color: #ccc !important;
    }
  }
}
</style>
