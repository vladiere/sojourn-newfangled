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
        component: () => import("pages/owner/building/BuildingOwned.vue"),
        meta: {
          requiresAuth: true,
          role: "owner",
        },
      },
      {
        path: "/add-building",
        name: "add-building",
        component: () => import("pages/owner/building/AddBuilding.vue"),
        meta: {
          requiresAuth: true,
          role: "owner",
        },
      },
      {
        path: "/edit",
        name: "edit",
        component: () => import("pages/owner/building/EditBuilding.vue"),
        meta: {
          requiresAuth: true,
          role: "owner",
        },
      },
      {
        path: "/reserve-list",
        name: "reserve-list",
        component: () => import("layouts/ReserveLayout.vue"),
        children: [
          {
            path: "",
            name: "reservelist",
            component: () => import("pages/owner/reserveList/ReserveList.vue"),
          },
          {
            path: "/accepted-reserve",
            name: "accepted-reserve",
            component: () => import("pages/owner/reserveList/AcceptList.vue"),
          },
          {
            path: "/declined-reserve",
            name: "declined-reserve",
            component: () => import("pages/owner/reserveList/DeclineList.vue"),
          },
        ],
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
      {
        path: "/payment",
        name: "payment",
        component: () => import("pages/customer/payment/PaymentPage.vue"),
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
  {
    path: "/sojourn-admin",
    name: "sojourn-admin",
    component: () => import("pages/admin/AdminPage.vue"),
  },
  {
    path: "/homepage",
    name: "homepage",
    component: () => import("layouts/AdminLayout.vue"),
    children: [
      {
        path: "",
        name: "users-page",
        component: () => import("pages/admin/AdminHomePage.vue"),
      },
      {
        path: "/customers",
        name: "customers-page",
        component: () => import("pages/admin/CustomersPage.vue"),
      },
      {
        path: "/admins",
        name: "admins-page",
        component: () => import("pages/admin/AdminsPage.vue"),
      },
    ],
  },
  // Always leave this as last one,
  // but you can also remove it
  {
    path: "/:catchAll(.*)*",
    component: () => import("pages/ErrorNotFound.vue"),
  },
];

export default routes;
