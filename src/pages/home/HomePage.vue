<template>
  <q-page padding>
    <HomeImgCard />
  </q-page>
</template>

<script setup>
import { defineComponent } from 'vue'
import HomeImgCard from 'src/components/card/HomeImgCard.vue';

defineComponent({
  name: 'HomePage'
})
</script>
