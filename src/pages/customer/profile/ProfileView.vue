<template>
  <q-page padding>
    <div class="column justify-center">
      <div class="col q-gutter-md row text-capitalize">
        <div class="col q-gutter-md">
          <q-input
            square
            outlined
            v-model="user.firstname"
            label="Firstname"
            color="black"
            readonly
          />
          <q-input
            square
            outlined
            v-model="user.lastname"
            label="Lastname"
            color="black"
            readonly
          />
          <q-input
            square
            outlined
            v-model="user.email"
            label="Email Address"
            color="black"
            readonly
          />
        </div>
        <div class="col q-gutter-md">
          <q-input
            square
            outlined
            v-model="user.birthdate"
            label="Birthdate"
            color="black"
            readonly
          />
          <q-input
            square
            outlined
            v-model="user.phone_number"
            label="Phone Number"
            color="black"
            readonly
          />
          <q-input
            square
            outlined
            v-model="user.username"
            label="Username"
            color="black"
            readonly
          />
        </div>
      </div>
      <div class="col"></div>
      <div class="col">
        <div class="row full-width justify-center text-capitalize">
          <div v-for="list in reserveList" :key="list.rent_id">
            <q-card-section vertical style="max-width: 500px; min-width: 300px">
              <q-card-section class="col-5 flex flex-center">
                <q-img
                  class="rounded-borders"
                  :src="getImageUrl(list.img_url)"
                  style="max-width: 300px"
                />
              </q-card-section>
              <q-card-section class="q-pt-xs">
                <div class="text-overline">
                  {{ date.formatDate(list.date_created, "MMM DD, YYYY") }}
                </div>
                <div class="text-h5 q-mt-sm q-mb-xs">
                  {{ list.building_name }}
                </div>
                <div class="text-caption text-grey-10">
                  <div class="column justify-center text-capitalize">
                    <span>Price: PHP-{{ list.total }}</span>
                    <span>Date In: {{ list.day_in }}</span>
                    <span>Date Out: {{ list.day_out }}</span>

                    <span :class="list.rent_status === 'pending' ? 'text-info text-h4' : list.rent_status === 'accept' ? 'text-positive text-h4' : 'text-negative text-h4'">{{ list.rent_status }}</span>
                  </div>
                </div>
              </q-card-section>
            </q-card-section>
          </div>
        </div>
      </div>
    </div>
  </q-page>
</template>

<script setup>
import { defineComponent, ref, onMounted } from "vue";
import { api } from "src/boot/axios";
import { useUserStore } from "src/stores/user-store";
import { date } from "quasar";

defineComponent({
  name: "ProfileView",
});

const useStore = useUserStore();
const userData = useStore.data;
const reserveList = ref({
  building_name: "",
  city: "",
  customer_id: 0,
  date_created: "",
  day_in: "",
  day_out: "",
  firstname: "",
  img_url: "",
  lastname: "",
  open_time: "",
  owner_id: 0,
  postal_code: 0,
  price: 0,
  province: "",
  rent_id: 0,
  rent_notif: "",
  rent_status: "",
  street: "",
  total: 0,
});
const user = ref({
  birthdate: userData.birthdate,
  created_at: userData.created_at,
  email: userData.email,
  firstname: userData.firstname,
  lastname: userData.lastname,
  phone_number: userData.phone_number,
  updated_at: userData.updated_at,
  username: userData.username,
});

const getImageUrl = (url) => {
  const publicPath = import.meta.env.BASE_URL;
  return `${publicPath}uploads/${url}`;
};

const getReserveList = async () => {
  const params = {
    customer_id: userData.id,
    rent_id: 0,
    owner_id: 0,
    stats: "",
  };

  const res = await api.get("/get-rent-building", { params });

  reserveList.value = res.data;

  console.log(reserveList.value);
};

onMounted(() => {
  getReserveList();
});
</script>
