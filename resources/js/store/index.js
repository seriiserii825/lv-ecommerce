export default {
    state: {
        user: null,
        isAuthenticated: false,
    },
    mutations: {
        setAuth(state, payload) {
            state.user = payload.user;
            state.isAuthenticated = Boolean(payload.user);
        },
    },
    actions: {
        async login({ commit }, credentials) {
            await axios.get("/sanctum/csrf-cookie");
            const { data } = await axios.post("/login", credentials);
            commit("setAuth", data);
        },
        logout({ commit }) {
            commit("setAuth", { user: false });
        },
        async checkAuth({ commit }) {
            try {
                const { data } = await axios.get("/api/current_user");
                console.log(data, "data");
                commit("setAuth", data);
            } catch (error) {
                commit("setAuth", false);
            }
        },
    },
    getters: {
        isAuthenticated(state) {
            return state.isAuthenticated;
        },
        currentUser(state) {
            return state.user;
        },
    },
};
