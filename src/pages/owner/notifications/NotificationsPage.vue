<template>
  <q-page padding>
    <div class="row full-width justify-center items-center">
      <div class="q-gutter-md column" style="max-width: 70%">

        <span class="text-h5">Recent Notifications</span>
        <q-separator />

        <div
          class="col row items-center q-gutter-md shadow-4 q-pa-md text-capitalize"
          v-for="rents in newrentData"
          :key="rents.id"
        >
          <q-avatar>
            <img src="https://www.svgrepo.com/show/508196/user-circle.svg" />
          </q-avatar>
          <div class="column">
            <span class="text-h5"
              >{{ rents.firstname }} {{ rents.lastname }}</span
            >
            <span caption>Reserve {{ rents.building_name }} Building</span>
          </div>
          <div class="column">
            <span caption>
              Date scheduled: from
              {{ date.formatDate(rents.day_in, "MMM D YYYY") }} to
              {{ date.formatDate(rents.day_out, "MMM D YYYY") }}
            </span>
            <span caption>
              {{ getDayDifference(rents.day_in, rents.day_out) }} day(s) of stay
            </span>
            <span caption>total price of PHP-{{ rents.price }}</span>
          </div>
        </div>

        <q-separator class="q-my-xl" />

        <div
          class="col row items-center q-gutter-md shadow-4 q-pa-md text-capitalize text-grey-6"
          v-for="rents in oldrentData"
          :key="rents.id"
        >
          <q-avatar>
            <img
              src="https://www.svgrepo.com/show/508196/user-circle.svg"
              color="grey-6"
            />
          </q-avatar>
          <div class="column">
            <span class="text-h5"
              >{{ rents.firstname }} {{ rents.lastname }}</span
            >
            <span caption>Reserve {{ rents.building_name }} Building</span>
          </div>
          <div class="column">
            <span caption>
              Date scheduled: from
              {{ date.formatDate(rents.day_in, "MMM D YYYY") }} to
              {{ date.formatDate(rents.day_out, "MMM D YYYY") }}
            </span>
            <span caption>
              {{ getDayDifference(rents.day_in, rents.day_out) }} day(s) of stay
            </span>
            <span caption>total price of PHP-{{ rents.price }}</span>
          </div>
        </div>
      </div>
    </div>
  </q-page>
</template>

<script setup>
import { defineComponent, onMounted, ref } from "vue";
import { api } from "src/boot/axios";
import { useUserStore } from "src/stores/user-store";
import { date } from "quasar";

defineComponent({
  name: "NotificationsPage",
});

const useStore = useUserStore();
const userData = useStore.data;
const newrentData = ref([]);
const oldrentData = ref([]);

const getDayDifference = (startDate, endDate) => {
  const start = new Date(startDate);
  const end = new Date(endDate);

  const millisecondsPerDay = 1000 * 60 * 60 * 24;
  const startUtc = Date.UTC(
    start.getFullYear(),
    start.getMonth(),
    start.getDate()
  );
  const endUtc = Date.UTC(end.getFullYear(), end.getMonth(), end.getDate());
  const difference = Math.floor((endUtc - startUtc) / millisecondsPerDay);

  return difference;
};

const getNotifications = async () => {
  const params = {
    customer_id: 0,
    rent_id: 0,
    owner_id: userData.id,
    stats: "",
  };

  const res = await api.get("/get-rent-building", { params });
  const now = new Date();
  const today = new Date(
    Date.UTC(now.getUTCFullYear(), now.getUTCMonth(), now.getUTCDate())
  );

  Object.entries(res.data)
    .map(([key, value]) => value)
    .forEach((value) => {
      const newDate = new Date(value.date_created);

      if (newDate.getDay() === today.getDay()) {
        newrentData.value.push(value);
      } else {
        oldrentData.value.push(value);
      }
    });

  console.log("new ", newrentData.value, "old", oldrentData.value);
};


onMounted(() => {
  getNotifications();

});
</script>
