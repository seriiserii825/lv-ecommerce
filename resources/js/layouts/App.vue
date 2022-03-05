<template>
  <div class="app">
    <color></color>
    <router-view></router-view>
  </div>
</template>
<script>
import Color from "../components/Color.vue";
export default {
  components: { Color },
};
</script>