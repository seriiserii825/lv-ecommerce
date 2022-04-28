import Admin from "./../pages/Admin.vue";
import Register from "./../pages/Register.vue";
import Login from "./../pages/Login.vue";
import Logout from "./../pages/Logout.vue";
import Home from "./../pages/Home.vue";

const authRoutes = [
    // { path: "/home", component: Home, name: "home" }, // auth
    { path: "/admin/index", component: Admin, name: "admin.index" },
    { path: "/register", component: Register, name: "register" },
    { path: "/admin/login", component: Login, name: "login" },
    { path: "/logout", component: Logout, name: "logout" },
];

export default authRoutes;
