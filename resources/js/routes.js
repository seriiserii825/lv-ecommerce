import authRoutes from "./routes/authRoutes";
import mediaRoutes from "./routes/mediaRoutes";

const routes = {
    mode: "history",
    routes: [...authRoutes, ...mediaRoutes, {path: "*", redirect: "/"}],
};
export default routes;
