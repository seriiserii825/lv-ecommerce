<template>
  <div>
    <h3>Admin</h3>
  </div>
</template>
<script>
export default {
  created() {
    if (!localStorage.getItem("mytoken")) {
      this.$notify({
        type: "error",
        message: "unauthorized",
      });
    }

    axios.defaults.headers.common = {
      Authorization: `Bearer ${localStorage.getItem("mytoken")}`,
      "Content-type": "application/json",
    };

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