import MediaIndex from "./../pages/media/Index.vue";
import MediaCreate from "./../pages/media/Create.vue";
import MediaEdit from "./../pages/media/Edit.vue";

const mediaRoutes = [
    {
        path: "/admin/media/create",
        component: MediaCreate,
        name: "admin.media.create",
    },
    {
        path: "/admin/media/edit/:id",
        component: MediaEdit,
        name: "admin.media.edit",
    },
    { path: "/admin/media", component: MediaIndex, name: "admin.media" }, //404
];

export default mediaRoutes;
