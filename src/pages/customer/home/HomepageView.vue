<template>
  <q-page padding>
    <div class="q-mt-xs row full-width q-gutter-md">
      <div class="wrap-sm row justify-center items-center q-gutter-md text-capitalize">
        <BuildingCardCustomer
          v-for="building in buildingData"
          :key="building.building_id"
          v-bind="building"
        />
      </div>
    </div>
  </q-page>
</template>

<script setup>
import { defineComponent, ref, onMounted } from "vue";
import BuildingCardCustomer from "src/components/card/BuildingCardCustomer.vue";
import { api } from "src/boot/axios";

defineComponent({
  name: "HomepageView",
});

const buildingData = ref({});
const search = ref("");

const getBuilding = async () => {
  const params = {
    search: search.value || "",
    id: 0,
  };

  const res = await api.get("/get-buildings", { params });

  buildingData.value = res.data[0];
};

onMounted(() => {
  getBuilding();
});
</script>
