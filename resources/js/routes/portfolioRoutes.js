import PortfolioIndex from "./../pages/portfolio/Index.vue";
import PortfolioCreate from "./../pages/portfolio/Create.vue";
import PortfolioEdit from "./../pages/portfolio/Edit.vue";

const portfolioRoutes = [
    {
        path: "/admin/portfolio",
        component: PortfolioIndex,
        name: "admin.portfolio",
    },
    {
        path: "/admin/portfolio/create",
        component: PortfolioCreate,
        name: "admin.portfolio.create",
    },
    {
        path: "/admin/portfolio/edit/:id",
        component: PortfolioEdit,
        name: "admin.portfolio.edit",
    },
];
export default portfolioRoutes;
