require("./bootstrap");

import Vue from "vue";
import VueRouter from "vue-router";
import Element from "element-ui";
import routes from "./routes";
// import User from "./helpers/User";

// window.User = User;
//support vuex
import Vuex from "vuex";

Vue.use(Vuex);
import storeData from "./store/index";

Vue.use(VueRouter);
Vue.use(Element);

window.Reload = new Vue();

Vue.component("app-component", require("./layouts/App.vue").default);

const store = new Vuex.Store(storeData);

const router = new VueRouter(routes);

new Vue({
    el: "#app",
    // store,
    router,
});
