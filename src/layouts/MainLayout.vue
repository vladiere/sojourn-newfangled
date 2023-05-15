<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated class="text-black">
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
          <q-btn dense round flat icon="fas fa-bell" @click="onItemClick('notifications')" >
            <q-badge color="red" floating transparent> 4 </q-badge>
          </q-btn>
          <q-avatar>
            <img src="https://cdn.quasar.dev/img/avatar.png" />
          </q-avatar>
          <span>John Añora</span>
          <q-btn-dropdown
            color="blue-grey-9"
            flat
            dropdown-icon="change_history"
          >
            <q-list>
              <q-item clickable v-close-popup @click="onItemClick('home')">
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
import { defineComponent, ref } from "vue";
import EssentialLink from "components/EssentialLink.vue";
import { useRouter } from "vue-router";

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
  {
    title: "Building Owned",
    caption: "My Building Own",
    icon: "fas fa-building-user",
    link: "building-owned",
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

    const toggleLeftDrawer = () => {
      leftDrawerOpen.value = !leftDrawerOpen.value;
    };

    const onItemClick = (path) => {
      if (path !== "logout") {
        router.push(path);
      }
    };

    return {
      essentialLinks: linksList,
      leftDrawerOpen,
      onItemClick,
      toggleLeftDrawer,
    };
  },
});
</script>
