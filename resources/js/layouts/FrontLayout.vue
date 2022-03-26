<template>
    <div>
        <el-menu
            :default-active="activeIndex"
            class="el-menu-demo front-menu"
            mode="horizontal"
        >
            <el-menu-item index="1">
                <router-link class="front-menu__link" :to="{ name: 'home' }"
                >Home
                </router-link
                >
            </el-menu-item>
            <el-menu-item index="2" v-if="is_auth">
                <router-link class="front-menu__link" :to="{ name: 'admin.index' }"
                >Admin
                </router-link
                >
            </el-menu-item>
            <el-menu-item index="3" v-if="!is_auth">
                <router-link class="front-menu__link" :to="{ name: 'login' }"
                >Login
                </router-link
                >
            </el-menu-item>
            <el-menu-item index="4" v-if="!is_auth">
                <router-link class="front-menu__link" :to="{ name: 'register' }"
                >Register
                </router-link
                >
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
            is_auth: false,
        };
    },
    methods: {
        handleSelect(key, keyPath) {
            console.log(key, keyPath);
        },
    },
    created() {
        axios.get('/api/front').then(res => {
            this.is_auth = res.data.user;
        }).catch(error => {
            this.is_auth = error.response.data.user;
        });
    }
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
