<template>
  <admin-layout>
    <el-row class="mb-3">
      <router-link :to="{ name: 'admin.employee' }">
        <el-button type="success">All employee</el-button>
      </router-link>
    </el-row>
    <h3 class="form__title">Edit employee</h3>
    <el-form label-width="120px">
      <el-row :gutter="20">
        <el-col :span="6">
          <el-form-item label="Full name">
            <el-input v-model="form.name"></el-input>
            <small class="form--error" v-if="errors && errors.name">{{
              errors.name[0]
            }}</small>
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="Email">
            <el-input v-model="form.email"></el-input>
            <small class="form--error" v-if="errors && errors.email">{{
              errors.email[0]
            }}</small>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="6">
          <el-form-item label="Address">
            <el-input v-model="form.address"></el-input>
            <small class="form--error" v-if="errors && errors.address">{{
              errors.address[0]
            }}</small>
          </el-form-item>
        </el-col>

        <el-col :span="6">
          <el-form-item label="Salary">
            <el-input v-model="form.salary"></el-input>
            <small class="form--error" v-if="errors && errors.salary">{{
              errors.salary[0]
            }}</small>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="6">
          <el-form-item label="Phone">
            <el-input v-model="form.phone"></el-input>
            <small class="form--error" v-if="errors && errors.phone">{{
              errors.phone[0]
            }}</small>
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="Nid">
            <el-input v-model="form.nid"></el-input>
            <small class="form--error" v-if="errors && errors.nid">{{
              errors.nid[0]
            }}</small>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="6">
          <el-form-item label="Photo">
            <input ref="photo" type="file" @change="choose_file($event)" />
          </el-form-item>
          <small class="form--error" v-if="errors && errors.photo">{{
            errors.photo[0]
          }}</small>
          <img :src="photo_preview" alt="" width="400" class="mb-4" />
        </el-col>
        <el-col :span="6">
          <el-form-item label="Join date">
            <el-date-picker
              v-model="form.join_date"
              type="date"
              placeholder="Pick a day"
            >
            </el-date-picker>
            <small class="form--error" v-if="errors && errors.join_date">{{
              errors.join_date[0]
            }}</small>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="6">
          <el-form-item>
            <el-button type="primary" @click.prevent="onSubmit"
              >Update
            </el-button>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
  </admin-layout>
</template>
<script>
import AdminLayout from "../../layouts/AdminLayout.vue";
import FormComponent from "../../components/FormComponent.vue";

export default {
  data() {
    return {
      form: {
        name: "",
        email: "",
        address: "",
        salary: "",
        join_date: "",
        nid: "",
        phone: "",
        photo: null,
      },
      photo_preview: null,
      errors: {},
    };
  },
  components: {
    AdminLayout,
    FormComponent,
  },
  methods: {
    choose_file(event) {
      let file = event.target.files[0];
      if (file.size > 250000) {
        this.$notify({
          type: "error",
          message: "File less than 2048",
        });
      } else {
        let reader = new FileReader();
        reader.onload = (event) => {
          this.form.photo = file;
          this.photo_preview = event.target.result;
        };
        reader.readAsDataURL(file);
      }
    },
    onSubmit() {
      let form = new FormData();

      for (let key in this.form) {
        form.append(key, this.form[key]);
      }
      form.append("_method", "PUT");

      axios
        .post("/api/auth/employee/" + this.$route.params.id, form)
        .then((res) => {
          this.$router.push({ name: "admin.employee" });
        })
        .catch((error) => {
          this.errors = error.response.data.errors;
        });
    },
  },
  created() {
    if (!User.loggedIn()) {
      this.$notify({
        type: "error",
        message: "You are not logged in yet",
      });
      this.$router.push({ name: "login" });
    }
    axios
      .get("/api/auth/employee/" + this.$route.params.id)
      .then((res) => {
        this.form = res.data.data;
        this.photo_preview = this.form.photo;
      })
      .catch((error) => {
        this.$notify({
          type: "error",
          message: error.response.data,
        });
      });
  },
};
</script>
