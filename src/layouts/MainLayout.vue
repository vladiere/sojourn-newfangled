<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated class="text-black text-capitalize">
      <q-toolbar>
        <q-btn
          flat
          dense
          round
          icon="menu"
          aria-label="Menu"
          @click="toggleLeftDrawer"
        />

        <q-toolbar-title> Sojourn Newfangled </q-toolbar-title>

        <div class="row items-center q-gutter-md q-mr-xl">
          <q-btn
            dense
            round
            flat
            icon="fas fa-bell"
            @click="onItemClick('notifications')"
          >
            <q-badge color="red" floating transparent v-if="unread !== 0">
              {{ unread }}
            </q-badge>
          </q-btn>
          <q-avatar>
            <img src="https://www.svgrepo.com/show/508196/user-circle.svg" />
          </q-avatar>
          <span>{{ userData.firstname }} {{ userData.lastname }}</span>
          <q-btn-dropdown
            color="blue-grey-9"
            flat
            dropdown-icon="change_history"
          >
            <q-list>
              <q-item clickable v-close-popup @click="onItemClick('owner')">
                <q-avatar>
                  <q-icon name="fas fa-house" />
                </q-avatar>
                <q-item-section>
                  <q-item-label>Home</q-item-label>
                </q-item-section>
              </q-item>

              <q-item clickable v-close-popup @click="onItemClick('profile')">
                <q-avatar>
                  <q-icon name="fas fa-user" />
                </q-avatar>
                <q-item-section>
                  <q-item-label>Profile</q-item-label>
                </q-item-section>
              </q-item>

              <q-item clickable v-close-popup @click="onItemClick('settings')">
                <q-avatar>
                  <q-icon name="fas fa-gear" />
                </q-avatar>
                <q-item-section>
                  <q-item-label>Settings</q-item-label>
                </q-item-section>
              </q-item>

              <q-item clickable v-close-popup @click="onItemClick('logout')">
                <q-avatar>
                  <q-icon name="fas fa-right-from-bracket" />
                </q-avatar>
                <q-item-section>
                  <q-item-label>Logout</q-item-label>
                </q-item-section>
              </q-item>
            </q-list>
          </q-btn-dropdown>
        </div>
      </q-toolbar>
    </q-header>

    <q-drawer v-model="leftDrawerOpen" show-if-above bordered>
      <q-list>
        <q-item-label header class="bg-blue-grey-7 text-white">
          Sojourn Newfangled
        </q-item-label>

        <EssentialLink
          class="q-mt-lg"
          v-for="link in essentialLinks"
          :key="link.title"
          v-bind="link"
        />
      </q-list>
      <q-list class="q-mt-xl">
        <q-item-label header> Sojourn Newfangled </q-item-label>
        <q-separator />
      </q-list>
    </q-drawer>

    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>
import { defineComponent, ref, watchEffect, onMounted } from "vue";
import EssentialLink from "components/EssentialLink.vue";
import { useRouter } from "vue-router";
import { useUserStore } from "src/stores/user-store";
import { api } from "src/boot/axios";

const linksList = [
  {
    title: "Add Building",
    caption: "Add new Building",
    icon: "fas fa-building",
    link: "add-building",
  },
  {
    title: "Reserve List",
    caption: "Reservation Listings",
    icon: "fas fa-list",
    link: "reserve-list",
  },
];

export default defineComponent({
  name: "MainLayout",

  components: {
    EssentialLink,
  },

  setup() {
    const leftDrawerOpen = ref(false);
    const router = useRouter();
    const useStore = useUserStore();
    const userData = useStore.data;
    const unread = ref(0);

    const toggleLeftDrawer = () => {
      leftDrawerOpen.value = !leftDrawerOpen.value;
    };

    const onItemClick = async (path) => {
      if (path !== "logout") {
        if (path === "notifications") {
          const params = {
            customer_id: 0,
            rent_id: 0,
            owner_id: userData.id,
            stats: "read",
          };

          await api.get("/get-rent-building", { params });
          router.push(path);
        }

        router.push(path);
      } else {
        useStore.logout();
        localStorage.clear();
        router.push("/");
      }
    };

    const getUnreadCount = async () => {
      const params = {
        customer_id: 0,
        rent_id: 0,
        owner_id: userData.id,
        stats: "unread",
      };

      const res = await api.get("/get-rent-building", { params });

      unread.value = res.data[0].unread;
    };

    onMounted(getUnreadCount);

    watchEffect(() => {
      setInterval(() => {
        getUnreadCount();
      }, 1000);
    });

    return {
      getUnreadCount,
      essentialLinks: linksList,
      leftDrawerOpen,
      onItemClick,
      toggleLeftDrawer,
      userData,
      unread,
    };
  },
});
</script>
