<template>
  <q-layout view="hHh lpR fFf">

    <q-header reveal elevated class="bg-info text-black">
      <div class="row no-wrap items-center q-pa-sm bg-info text-black">
        <q-avatar>
          <img src="../assets/sojourn-logo.png">
        </q-avatar>
        <span class="text-h5 q-ml-md">
          Sojourn Newfangled
        </span>

      <q-space />

      <div class="q-mr-md">
          <q-avatar>
            <img src="https://www.svgrepo.com/show/508196/user-circle.svg" />
          </q-avatar>
          <span class="q-ml-sm text-subtitle1 text-capitalize">{{ userData.firstname }} {{ userData.lastname }}</span>
          <q-btn-dropdown
            color="blue-grey-9"
            flat
            dropdown-icon="change_history"
          >
            <q-list>
              <q-item clickable v-close-popup @click="onItemClick('customer')">
                <q-avatar>
                  <q-icon name="fas fa-house" />
                </q-avatar>
                <q-item-section>
                  <q-item-label>Home</q-item-label>
                </q-item-section>
              </q-item>

              <q-item clickable v-close-popup @click="onItemClick('customer-profile')">
                <q-avatar>
                  <q-icon name="fas fa-user" />
                </q-avatar>
                <q-item-section>
                  <q-item-label>Profile</q-item-label>
                </q-item-section>
              </q-item>

              <q-item clickable v-close-popup @click="onItemClick('customer-settings')">
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
    </div>
    </q-header>

    <q-page-container>
      <router-view />
    </q-page-container>

  </q-layout>
</template>

<script setup>
import { defineComponent, onMounted, ref } from 'vue'
import { useRouter } from 'vue-router';
import { useUserStore } from 'src/stores/user-store';

defineComponent({
  name: 'CustomerLayout'
})

const router = useRouter()
const useStore = useUserStore()
const userData = ref({})

userData.value = useStore.data

console.log(userData.value)

const onItemClick = (path) => {
  if (path !== 'logout') {
    router.push(path)
  } else {
    useStore.logout()
    localStorage.clear()
    router.push('/')
  }
}
</script>
