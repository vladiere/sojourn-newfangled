<template>
  <q-page padding>
    <div class="column full-width justify-center items-center">
      <div class="row full-width justify-center items-center">
        <div
          class="q-gutter-md row items-center text-capitalize"
          style="width: 60%"
        >
          <div
            class="column items-center text-h6 q-pa-md shadow-16"
            v-for="list in declineList"
            :key="list.id"
            style="min-width: 30%"
          >
            <div class="col">
              <q-avatar class="q-mr-md">
                <img
                  src="https://www.svgrepo.com/show/508196/user-circle.svg"
                />
              </q-avatar>
              <span>{{ list.firstname }} {{ list.lastname }}</span>
            </div>
            <div class="col column text-subtitle1">
              <span>Building: {{ list.building_name }}</span>
              <span>Price: PHP{{ list.price }}</span>
              <span>Date In: {{ list.day_in }}</span>
              <span>Date Out: {{ list.day_out }}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </q-page>
</template>

<script setup>
import { defineComponent, ref, onMounted, watchEffect } from "vue";
import { useUserStore } from "src/stores/user-store";
import { api } from "src/boot/axios";

defineComponent({
  name: "DeclineList",
});

const useStore = useUserStore();
const userData = useStore.data;
const reserveList = ref([]);
const acceptList = ref([]);
const declineList = ref([]);
const actionPerform = ref(false);

const getReserveList = async (stats, id) => {
  const params = {
    customer_id: 0,
    rent_id: id || 0,
    owner_id: userData.id,
    stats: stats || "",
  };

  const res = await api.get("/get-rent-building", { params });

  Object.entries(res.data).map(([key, value]) => {
    if (value.rent_status === "accept") {
      acceptList.value.push(value);
    } else if (value.rent_status === "decline") {
      declineList.value.push(value);
    } else {
      reserveList.value.push(value);
    }
  });
};



watchEffect(() => {
  getReserveList();
});
</script>
