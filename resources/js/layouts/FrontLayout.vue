<template>
    <div>
        <header-front/>
        <slot></slot>
    </div>
</template>
<script>
import HeaderFront from "../components/front/HeaderFront";

export default {
    components: {HeaderFront},
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
