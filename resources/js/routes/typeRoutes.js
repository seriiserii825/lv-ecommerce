import TypeIndex from "./../pages/type/Index.vue";
import TypeCreate from "./../pages/type/Create.vue";
import TypeEdit from "./../pages/type/Edit.vue";

const typeRoutes = [
    {
        path: "/admin/type",
        component: TypeIndex,
        name: "admin.type",
    },
    {
        path: "/admin/type/create",
        component: TypeCreate,
        name: "admin.type.create",
    },
    {
        path: "/admin/type/edit/:id",
        component: TypeEdit,
        name: "admin.type.edit",
    },
];
export default typeRoutes;
