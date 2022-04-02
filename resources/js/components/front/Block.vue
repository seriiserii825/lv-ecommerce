<template>
    <div class="block">
        <h2>{{ title }}</h2>
        <slot></slot>
    </div>
</template>
<script>
export default {
    props: ['title']
}
</script>
<style lang="scss">
@import '@/_variables.scss';
.block {
    margin-bottom: 3rem;
    padding: 3rem;
    color: $text-light;
    background-color: white;
    box-shadow: 0 4px 8px -4px rgba(0, 0, 0, 0.2);
    h2 {
        margin-bottom: 2rem;
        font-size: 2.4rem;
        font-weight: bold;
        color: $text-color;
    }
    h3 {
        margin-bottom: 1.8rem;
        font-size: 1.6rem;
        font-weight: bold;
        color: #778492;
    }
    p {
        margin-bottom: 3rem;
        line-height: 1.5;
    }
    a {
        text-decoration: none;
        color: inherit;
    }
    em {
        opacity: .6;
    }
    ul {
        li {
            position: relative;
            margin-bottom: 1.5rem;
            padding-left: 1.5rem;
            &::before {
                content: '';
                position: absolute;
                top: 0.8rem;
                left: 0;
                width: 0.5rem;
                height: 0.5rem;
                background-color: $text-light;
                border-radius: 50%;
            }
        }
    }
    a {
        transition: all .4s;
        &:hover {
            color: $contrast;
        }
    }
}
</style>
