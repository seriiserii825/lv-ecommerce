import PostIndex from "./../pages/post/Index.vue";
import PostCreate from "./../pages/post/Create.vue";
import PostEdit from "./../pages/post/Edit.vue";

const postRoutes = [
    {
        path: "/admin/post",
        component: PostIndex,
        name: "admin.post",
    },
    {
        path: "/admin/post/create",
        component: PostCreate,
        name: "admin.post.create",
    },
    {
        path: "/admin/post/edit/:id",
        component: PostEdit,
        name: "admin.post.edit",
    },
];
export default postRoutes;
