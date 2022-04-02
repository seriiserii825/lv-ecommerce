<template>
    <div class="media-grid-item" :class="{ active: active }" @click="toggleImage">
        <el-checkbox v-model="checked">Option</el-checkbox>
        <h4 class="media-grid-item__title">{{ shortTitle(title) }}</h4>
        <img :src="path" alt=""/>
    </div>
</template>
<script>
export default {
    props: {
        title: String,
        path: String,
    },
    data() {
        return {
            active: false,
            checked: false,
        };
    },
    methods: {
        shortTitle(title) {
            if (title.length > 20) {
                title = title.slice(0, 20) + "..." + title.slice(-4);
                return title;
            }
            return title;
        },
        toggleImage() {
            this.active = !this.active;
            if (this.active) {
                this.checked = true;
                this.$emit("add-image", this.path);
            } else {
                this.checked = false;
                this.$emit("remove-image", this.path);
            }
        },
    },
};
</script>
<style lang="scss">
.media-grid-item {
    position: relative;
    width: 18rem;
    height: 12rem;
    opacity: 0.7;
    transition: all 0.4s;
    cursor: pointer;
    img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
        z-index: 1;
    }
    &.active {
        opacity: 1;
    }
    &__title {
        position: absolute;
        bottom: 0;
        left: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 0 2rem;
        width: 100%;
        height: 4rem;
        font-size: 1.4rem;
        text-align: center;
        color: black;
        background-color: white;
        z-index: 2;
    }
    .el-checkbox {
        position: relative;
        top: -0.4rem;
        left: 0;
        z-index: 2;
        .el-checkbox__label {
            display: none;
        }
        &__inner {
            left: 0.4rem;
        }
    }
}
</style>
