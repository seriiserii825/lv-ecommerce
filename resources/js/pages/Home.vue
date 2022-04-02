<template>
    <front-layout>
        <div class="container">
            <div class="page-wrapper">
                <div class="page-wrapper__main">
                    <Block title="Последние записи"></Block>
                </div>
            </div>
        </div>
    </front-layout>
</template>
<script>
import Block from "../components/front/Block";
import FrontLayout from "../layouts/FrontLayout.vue";

export default {
    components: {
        Block,
        FrontLayout,
    },
};
</script>
<style lang="scss">
.page-wrapper {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    padding: 6rem 1.5rem;
    &__main {
        width: 65%;
    }
    &__aside {
        width: 30%;
    }
}
</style>
