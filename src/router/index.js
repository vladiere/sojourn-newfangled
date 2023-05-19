import { route } from "quasar/wrappers";
import {
  createRouter,
  createMemoryHistory,
  createWebHistory,
  createWebHashHistory,
} from "vue-router";
import routes from "./routes";
import { useUserStore } from "src/stores/user-store";

/*
 * If not building with SSR mode, you can
 * directly export the Router instantiation;
 *
 * The function below can be async too; either use
 * async/await or return a Promise which resolves
 * with the Router instance.
 */

const userGuard = (to, from, next) => {
  const requiresAuth = to.meta.requiresAuth;
  const role = to.meta.role;

  if (requiresAuth) {
    const useStore = useUserStore();
    const isAuthenticated = useStore.isAuthenticated;
    const userRole = useStore.data.st_role;
    
    if (isAuthenticated && userRole === role) {
      next();
    } else {
      if (from.name) {
        next({ name: from.name })
      } else {
        next({ name: "login" });
      }
    }
  } else {
    next();
  }
};

export default route(function (/* { store, ssrContext } */) {
  const createHistory = process.env.SERVER
    ? createMemoryHistory
    : process.env.VUE_ROUTER_MODE === "history"
    ? createWebHistory
    : createWebHashHistory;

  const Router = createRouter({
    scrollBehavior: () => ({ left: 0, top: 0 }),
    routes,

    // Leave this as is and make changes in quasar.conf.js instead!
    // quasar.conf.js -> build -> vueRouterMode
    // quasar.conf.js -> build -> publicPath
    history: createHistory(process.env.VUE_ROUTER_BASE),
  });

  Router.beforeEach(userGuard);

  return Router;
});
