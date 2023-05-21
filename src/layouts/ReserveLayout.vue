<template>
  <q-layout>
    <q-header class="bg-white text-black">
      <q-toolbar>
        <q-toolbar-title>
          <q-btn label="Pending List" flat to="reserve-list" />
          <q-btn label="Accepted List" flat to="accepted-reserve"/>
          <q-btn label="Declined List" flat to="declined-reserve"/>
        </q-toolbar-title>
      </q-toolbar>
    </q-header>

    <q-page-container>
      <router-view />
    </q-page-container>

  </q-layout>
</template>

<script setup>
import { defineComponent, ref } from 'vue'

defineComponent({
  name: 'ReserveLayout'
})

</script>
