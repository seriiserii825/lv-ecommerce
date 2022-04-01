import authRoutes from "./routes/authRoutes";
import categoryRoutes from "./routes/categoryRoutes";
import postRoutes from "./routes/postRoutes";
import mediaRoutes from "./routes/mediaRoutes";
import typeRoutes from "./routes/typeRoutes";

const routes = {
    mode: "history",
    routes: [
        ...authRoutes,
        ...mediaRoutes,
        ...categoryRoutes,
        ...postRoutes,
        ...typeRoutes,
        {path: "*", redirect: "/"}
    ],
};
export default routes;
