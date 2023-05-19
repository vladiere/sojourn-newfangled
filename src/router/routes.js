const routes = [
  {
    path: "/",
    name: "login",
    component: () => import("pages/login/LoginPage.vue"),
  },
  {
    path: "/owner",
    name: "owner",
    component: () => import("layouts/MainLayout.vue"),
    children: [
      {
        path: "",
        name: "owner",
        component: () => import("pages/owner/home/BuildingOwned.vue"),
        meta: {
          requiresAuth: true,
          role: "owner",
        },
      },
      {
        path: "/add-building",
        name: "add-building",
        component: () => import("pages/owner/addBuilding/AddBuilding.vue"),
        meta: {
          requiresAuth: true,
          role: "owner",
        },
      },
      {
        path: "/reserve-list",
        name: "reserve-list",
        component: () => import("pages/owner/reserveList/ReserveList.vue"),
        meta: {
          requiresAuth: true,
          role: "owner",
        },
      },
      {
        path: "/settings",
        name: "settings",
        component: () => import("pages/owner/settings/SettingsPage.vue"),
        meta: {
          requiresAuth: true,
          role: "owner",
        },
      },
      {
        path: "/profile",
        name: "profile",
        component: () => import("pages/owner/profile/ProfilePage.vue"),
        meta: {
          requiresAuth: true,
          role: "owner",
        },
      },
      {
        path: "/notifications",
        name: "notifications",
        component: () =>
          import("pages/owner/notifications/NotificationsPage.vue"),
        meta: {
          requiresAuth: true,
          role: "owner",
        },
      },
    ],
    meta: {
      requiresAuth: true,
      role: "owner",
    },
  },
  {
    path: "/customer",
    name: "customer",
    component: () => import("layouts/CustomerLayout.vue"),
    children: [
      {
        path: "",
        name: "customer",
        component: () => import("pages/customer/home/HomepageView.vue"),
        meta: {
          requiresAuth: true,
          role: "customer",
        },
      },
      {
        path: "/customer-profile",
        name: "customer-profile",
        component: () => import("pages/customer/profile/ProfileView.vue"),
        meta: {
          requiresAuth: true,
          role: "customer",
        },
      },
      {
        path: "/customer-settings",
        name: "customer-settings",
        component: () => import("pages/customer/settings/SettingsView.vue"),
        meta: {
          requiresAuth: true,
          role: "customer",
        },
      },
    ],
    meta: {
      requiresAuth: true,
      role: "customer",
    },
  },
  {
    path: "/register",
    name: "register",
    component: () => import("pages/register/RegisterPage.vue"),
  },
  {
    path: "/recover-password?auth=",
    name: "recover-password",
    component: () => import("pages/recovery/RecoveryPage.vue"),
  },

  // Always leave this as last one,
  // but you can also remove it
  {
    path: "/:catchAll(.*)*",
    component: () => import("pages/ErrorNotFound.vue"),
  },
];

export default routes;
