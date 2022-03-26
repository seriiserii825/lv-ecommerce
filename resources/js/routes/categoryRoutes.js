import CategoryIndex from "./../pages/category/Index.vue";
import CategoryCreate from "./../pages/category/Create.vue";
import CategoryEdit from "./../pages/category/Edit.vue";

const categoryRoutes = [
    {
        path: "/admin/category",
        component: CategoryIndex,
        name: "admin.category",
    },
    {
        path: "/admin/category/create",
        component: CategoryCreate,
        name: "admin.category.create",
    },
    {
        path: "/admin/category/edit/:id",
        component: CategoryEdit,
        name: "admin.category.edit",
    },
];
export default categoryRoutes;
