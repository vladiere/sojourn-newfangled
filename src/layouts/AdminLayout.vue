<template>
  <q-layout view="hHr lpR fFf">
    <q-header reveal elevated class="bg-secondary text-white">
      <q-toolbar>
        <q-toolbar-title>
          <q-avatar>
            <img src="../assets/sojourn-logo.png" />
          </q-avatar>
          Sojourn Newfangled
        </q-toolbar-title>

        <q-btn-dropdown flat dropdown-icon="change_history">
          <q-list>
            <q-item clickable v-close-popup @click="onItemClick('owners')">
              <q-item-section>
                <q-item-label>Owners</q-item-label>
              </q-item-section>
            </q-item>

            <q-item clickable v-close-popup @click="onItemClick('customers')">
              <q-item-section>
                <q-item-label>Customers</q-item-label>
              </q-item-section>
            </q-item>

            <q-item clickable v-close-popup @click="onItemClick('admins')">
              <q-item-section>
                <q-item-label>Admins</q-item-label>
              </q-item-section>
            </q-item>

            <q-item clickable v-close-popup @click="onItemClick('logout')">
              <q-item-section>
                <q-item-label>Logout</q-item-label>
              </q-item-section>
            </q-item>
          </q-list>
        </q-btn-dropdown>
      </q-toolbar>
    </q-header>

    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script setup>
import { defineComponent, ref } from "vue";
import { useRouter } from 'vue-router'

defineComponent({
  name: "AdminLayoutName",
});

const getImageUrl = (url) => {
  const publicPath = import.meta.env.BASE_URL;
  return `${publicPath}assets/${url}`;
};

const onItemClick = (path) => {

}
</script>
