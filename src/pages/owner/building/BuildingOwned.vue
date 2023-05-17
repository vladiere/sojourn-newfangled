<template>
  <q-page padding class="q-pa-lg">
    <BuildingCard />
  </q-page>
</template>

<script setup>
import { defineComponent } from 'vue'
import BuildingCard from 'src/components/card/BuildingCard.vue';

defineComponent({
  name: 'BuildingOwned'
})
</script>
