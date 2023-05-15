
const routes = [
  {
    path: "/",
    name: "login",
    component: () => import("pages/login/LoginPage.vue"),
  },
  {
    path: "/home",
    name: "home",
    component: () => import("layouts/MainLayout.vue"),
    children: [
      {
        path: "",
        name: 'home',
        component: () => import("pages/home/HomePage.vue"),
      },
      {
        path: '/add-building',
        name: 'add-building',
        component: () => import('pages/addBuilding/AddBuilding.vue')
      },
      {
        path: '/reserve-list',
        name: 'reserve-list',
        component: () => import('pages/reserveList/ReserveList.vue')
      },
      {
        path: '/building-owned',
        name: 'building-owned',
        component: () => import('pages/building/BuildingOwned.vue')
      },
      {
        path: '/settings',
        name: 'settings',
        component: () => import('pages/settings/SettingsPage.vue')
      },
      {
        path: '/profile',
        name: 'profile',
        component: () => import('pages/profile/ProfilePage.vue')
      },
      {
        path: '/notifications',
        name: 'notifications',
        component: () => import('pages/notifications/NotificationsPage.vue')
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
