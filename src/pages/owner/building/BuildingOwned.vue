<template>
  <q-page padding class="q-pa-lg">
    <div v-if="isEmpty" class="column justify-center items-center q-mt-xl">
      <span class="text-h2">Put something inside...</span>
      <q-img
        :src="getImageUrl('empty-box.svg')"
        style="width: 30%"
        alt="SVG Image"
      />
    </div>
    <div class="q-mt-md row full-width">
      <div class="wrap-sm row justify-center items-center q-gutter-md">
        <BuildingCard
          class="text-capitalize"
          v-for="building in buildingData"
          :key="building.building_id"
          v-bind="building"
        />
      </div>
    </div>
  </q-page>
</template>

<script setup>
import { defineComponent, onMounted, ref, watchEffect } from "vue";
import BuildingCard from "src/components/card/BuildingCard.vue";
import { api } from "src/boot/axios";
import { useUserStore } from "src/stores/user-store";

defineComponent({
  name: "BuildingOwned",
});

const buildingData = ref({});
const search = ref("");
const isEmpty = ref(false);
const useStore = useUserStore();
const userData = useStore.data;

const getBuilding = async () => {
  const params = {
    search: search.value || "",
    id: 0,
    owner_id: userData.id
  };

  const res = await api.get("/get-buildings", { params });

  buildingData.value = res.data[0];
};

const getImageUrl = (url) => {
  const publicPath = import.meta.env.BASE_URL;
  return `${publicPath}icons/${url}`;
};

onMounted(() => {
  getBuilding();
});

watchEffect(() => {
  if (buildingData.value.length == 0) {
    isEmpty.value = true;
  }
});
</script>
