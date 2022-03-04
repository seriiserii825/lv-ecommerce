<template>
  <div>
    <h3>Admin</h3>
  </div>
</template>
<script>
export default {
  created() {
    axios
      .get("/api/admin")
      .then((res) => {
        console.log(res, "res");
      })
      .catch((error) => {
        console.log(error.response, "error.response");
      });
  },
};
</script>
<style lang="scss">
</style>