<template>
    <div class="form-block">
        <header class="form-block__header">{{ title }}</header>
        <div class="form-block__content">
            <slot></slot>
        </div>
    </div>
</template>
<script>
export default {
    props: ['title']
}
</script>
<style lang="scss">
.form-block {
    border: 1px solid #444;
    &__header {
        padding: 1rem 3rem;
        color: white;
        background-color: #444;
    }
    &__content {
        padding: 1rem 3rem;
    }
    &__editor {
        margin-bottom: 8rem;
    }
}
</style>
