
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
        component: () => import("pages/owner/home/HomePage.vue"),
      },
      {
        path: "/add-building",
        name: "add-building",
        component: () => import("pages/owner/addBuilding/AddBuilding.vue"),
      },
      {
        path: "/reserve-list",
        name: "reserve-list",
        component: () => import("pages/owner/reserveList/ReserveList.vue"),
      },
      {
        path: "/building-owned",
        name: "building-owned",
        component: () => import("pages/owner/building/BuildingOwned.vue"),
      },
      {
        path: "/settings",
        name: "settings",
        component: () => import("pages/owner/settings/SettingsPage.vue"),
      },
      {
        path: "/profile",
        name: "profile",
        component: () => import("pages/owner/profile/ProfilePage.vue"),
      },
      {
        path: "/notifications",
        name: "notifications",
        component: () =>
          import("pages/owner/notifications/NotificationsPage.vue"),
      },
    ],
    // meta: {
    //   requiresAuth: true,
    //   role: "owner",
    // },
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
      },
      {
        path: "/customer-profile",
        name: "customer-profile",
        component: () => import("pages/customer/profile/ProfileView.vue"),
      },
      {
        path: "/customer-settings",
        name: "customer-settings",
        component: () => import("pages/customer/settings/SettingsView.vue"),
      },
    ],
    // meta: {
    //   requiresAuth: true,
    //   role: "customer",
    // },
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

export default routes
