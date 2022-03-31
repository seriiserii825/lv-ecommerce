import authRoutes from "./routes/authRoutes";
import categoryRoutes from "./routes/categoryRoutes";
import postRoutes from "./routes/postRoutes";
import mediaRoutes from "./routes/mediaRoutes";

const routes = {
    mode: "history",
    routes: [
        ...authRoutes,
        ...mediaRoutes,
        ...categoryRoutes,
        ...postRoutes,
        {path: "*", redirect: "/"}
    ],
};
export default routes;
