<template>
  <div class="color">
    <ul>
      <li class="color_1">color_1</li>
      <li class="color_2">color_2</li>
      <li class="color_3">color_3</li>
      <li class="color_4">color_4</li>
      <li class="color_5">color_5</li>
      <li class="color_6">color_6</li>
      <li class="color_7">color_7</li>
      <li class="color_8">color_8</li>
      <li class="color_9">color_9</li>
    </ul>
  </div>
</template>
<script>
export default {};
</script>
<style lang="scss">
@import "@/_variables";
.color {
  position: fixed;
  bottom: 10rem;
  right: 0;
  width: 8rem;
  height: auto;
  z-index: 1000;
  li {
      margin: 0.4rem;
      padding: 0 1rem;
      font-size: 1.4rem;
      border: 1px solid $color_3;
      border-radius: 0.5rem;
  }
  &_1 {
    background: $color_1;
  }
  &_2 {
    background: $color_2;
  }
  &_3 {
      color: white;
    background: $color_3;
  }
  &_4 {
    background: $color_4;
  }
  &_5 {
    background: $color_5;
  }
  &_6 {
    background: $color_6;
  }
  &_7 {
    background: $color_7;
  }
  &_8 {
    background: $color_8;
  }
  &_9 {
    background: $color_9;
  }
}
</style>