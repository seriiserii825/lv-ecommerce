<template>
    <div class="images-thumbs">
        <div class="images-thumbs__item" v-for="image in images" :key="image">
            <img :src="image" alt="" />
        </div>
    </div>
</template>
<script>
export default {
    props: {
        images: Array,
    },
};
</script>
<style lang="scss">
.images-thumbs {
    display: flex;
    justify-content: flex-start;
    flex-wrap: wrap;
    margin-top: 3rem;
    &__item {
        margin-bottom: 2rem;
        margin-right: 2rem;
        width: 10rem;
        height: 5rem;
    }
}
</style>
