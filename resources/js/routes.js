import authRoutes from "./routes/authRoutes";
import categoryRoutes from "./routes/categoryRoutes";
import mediaRoutes from "./routes/mediaRoutes";

const routes = {
    mode: "history",
    routes: [
        ...authRoutes,
        ...mediaRoutes,
        ...categoryRoutes,
        {path: "*", redirect: "/"}
    ],
};
export default routes;
