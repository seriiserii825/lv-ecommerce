<template>
  <el-aside width="200px">
    <el-menu :default-openeds="['1']">
      <el-menu-item index="1">
        <router-link :to="{ name: 'admin.index' }" exact>
          <i class="el-icon-s-shop"></i>
          <span>Dashboard</span>
        </router-link>
      </el-menu-item>
      <el-submenu index="2">
        <template slot="title"
          ><i class="el-icon-s-check"></i>Employee(Worker)
        </template>
        <el-menu-item-group>
          <el-menu-item index="2-1">
            <router-link :to="{ name: 'admin.index' }">
              <i class="el-icon-document-add"></i>
              <span>Create</span>
            </router-link>
          </el-menu-item>
          <el-menu-item index="2-2">
            <router-link :to="{ name: 'admin.index' }" exact>
              <i class="el-icon-tickets"></i>
              <span>List</span>
            </router-link>
          </el-menu-item>
        </el-menu-item-group>
      </el-submenu>
    </el-menu>
  </el-aside>
</template>
<style lang="scss">
.el-aside {
  min-height: 300vh;
  background-color: #333;
  .el-menu {
    background-color: #333;
    border: none;
    li {
      padding: 0 !important;
      transition: all 0.4s;
      background-color: #003546;
      &:hover {
        background-color: lighten(#003546, 10%);
      }
      a {
        display: block;
        padding: 0 2rem;
        text-decoration: none;
        color: white;
        &.router-link-exact-active {
          background-color: #a1a100;
        }
      }
      .el-submenu__title {
        color: white;
        &:hover {
          background: inherit;
        }
      }
      ul {
        li {
          background-color: darken(#003546, 5%);
        }
      }
    }
    .el-submenu.is-opened {
      .el-submenu__title {
        background-color: #a1a100;
      }
    }
  }
}
</style>
