<template>
  <div class="form"><slot /></div>
</template>
<script>
export default {};
</script>
<style lang="scss">
.form {
  padding: 4rem;
  width: 30%;
  box-shadow: 0 0 20px 10px rgba(0, 0, 0, 0.1);
  &__title {
    margin-bottom: 3rem;
    font-size: 3rem;
    font-weight: bold;
  }
  &__link {
    color: darkblue;
    text-decoration: none;
  }
  &--error {
    display: inline-block;
    padding: 1rem 2rem;
    font-size: 1.4rem;
    line-height: 1;
    color: red;
    border: 1px solid red;
  }
}
.el-form-item {
  display: flex;
  flex-direction: column;
  margin-bottom: 1.5rem;
  &__label {
    font-weight: bold;
    text-align: left;
  }
}
.el-form-item__content {
  margin-left: 0 !important;
}
</style>