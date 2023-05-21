<template>
  <div
    class="column items-center text-h6 q-pa-md shadow-16"
    style="min-width: 30%"
    v-if="actionPerformed && rent_status === 'pending'"
  >
    <div class="col">
      <q-avatar class="q-mr-md">
        <img src="https://www.svgrepo.com/show/508196/user-circle.svg" />
      </q-avatar>
      <span>{{ firstname }} {{ lastname }}</span>
    </div>
    <div class="col column text-subtitle1">
      <span>Building: {{ building_name }}</span>
      <span>Price: PHP{{ total }}</span>
      <span>Date In: {{ day_in }}</span>
      <span>Date Out: {{ day_out }}</span>
      <span>Payment Method: {{ payment_method || 'Cash' }}</span>
    </div>
    <div class="col q-gutter-md q-mt-md">
      <q-btn
        round
        color="secondary"
        icon="check"
        @click="getReserveList('accept', rent_id)"
      />
      <q-btn
        round
        color="negative"
        icon="close"
        @click="getReserveList('decline', rent_id)"
      />
    </div>
  </div>
</template>

<script setup>
import { defineComponent, ref } from "vue";
import { api } from "src/boot/axios";
import { useUserStore } from "src/stores/user-store";

defineComponent({
  name: "ReserveListCard",
});

defineProps({
  barangay: {
    type: String,
  },
  building_name: {
    type: String,
  },
  city: {
    type: String,
  },
  customer_id: {
    type: Number,
  },
  date_created: {
    type: String,
  },
  day_in: {
    type: String,
  },
  day_out: {
    type: String,
  },
  firstname: {
    type: String,
  },
  img_url: {
    type: String,
  },
  lastname: {
    type: String,
  },
  open_time: {
    type: String,
  },
  owner_id: {
    type: Number,
  },
  postal_code: {
    type: Number,
  },
  price: {
    type: Number,
  },
  province: {
    type: String,
  },
  rent_id: {
    type: Number,
  },
  rent_notif: {
    type: String,
  },
  rent_status: {
    type: String,
  },
  street: {
    type: String,
  },
  total: {
    type: Number,
  },
  payment_method: {
    type: String,
  },
});

const actionPerformed = ref(true)
const useStore = useUserStore()
const userData = useStore.data


const getReserveList = async (stats, id) => {

  const params = {
    customer_id: 0,
    rent_id: id,
    owner_id: userData.id,
    stats: stats,
  };

  const res = await api.get("/get-rent-building", { params });
  if (res.data[0].st_code == 200) {
    actionPerformed.value = false
  }
};

</script>
