<template>
  <q-page padding>
    <div class="column full-width justify-center items-center">
      <div class="row full-width justify-center items-center">
        <div class="q-gutter-md row items-center text-capitalize full-width">
          <ReserveListCard
            v-for="list in reserveList"
            :key="list.rent_id"
            v-bind="list"
          />
        </div>
      </div>
    </div>
  </q-page>
</template>

<script setup>
import { defineComponent, ref, onMounted, watchEffect } from "vue";
import { useUserStore } from "src/stores/user-store";
import ReserveListCard from "components/card/ReserveListCard.vue";
import { api } from "src/boot/axios";

defineComponent({
  name: "ReserveList",
});

const useStore = useUserStore();
const userData = useStore.data;
const reserveList = ref({});

const getReserveList = async () => {
  const params = {
    customer_id: 0,
    rent_id: 0,
    owner_id: userData.id,
    stats: "",
  };

  const res = await api.get("/get-rent-building", { params });

  reserveList.value = res.data;

};

onMounted(() => {
  getReserveList();
});
</script>
