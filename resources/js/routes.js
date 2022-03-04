import authRoutes from "./routes/authRoutes";

const routes = {
    mode: "history",
    routes: [...authRoutes, { path: "*", redirect: "/" }],
};
export default routes;
