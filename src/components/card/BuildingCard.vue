<template>
  <q-card
    v-if="!deleted"
    class="my-card"
    flat
    bordered
    style="max-width: 600px; max-height: 300px"
  >
    <q-card-section horizontal>

      <q-card-section class="q-pt-xs">
        <div class="text-overline">{{ date_created }}</div>
        <div class="text-h5 q-mt-sm q-mb-xs">{{ building_name }}</div>
        <div class="text-caption text-grey-10">
          <div class="column justify-center text-capitalize">
            <span>Price: {{ price }}</span>
            <span>Open Hours: {{ open_hours }}</span>
            <span>Location: {{ location }}</span>
            <span>Status: {{ building_status }}</span>
          </div>
        </div>
      </q-card-section>
      <q-card-section class="col-5 flex flex-center">
        <q-img
          class="rounded-borders"
          :src="getImageUrl(img_url)"
          style="object-fit: cover"
        />
      </q-card-section>

    </q-card-section>

    <q-separator />

    <q-card-actions>
      <q-btn flat @click="handleEdit(building_id)"> Edit </q-btn>
      <q-btn
        flat
        align="right"
        color="negative"
        @click="handleDelete(building_id)"
      >
        Remove
      </q-btn>
    </q-card-actions>
  </q-card>
</template>

<script setup>
import { defineComponent, ref, watchEffect } from "vue";
import { useRouter } from "vue-router";
import { api } from "src/boot/axios";
import { useQuasar } from "quasar";
import { useUserStore } from "src/stores/user-store";

defineComponent({
  name: "BuildingCard",
});

defineProps({
  building_id: {
    type: Number,
  },
  building_name: {
    type: String,
  },
  price: {
    type: String,
  },
  open_hours: {
    type: String,
  },
  date_created: {
    type: String,
  },
  date_updated: {
    type: String,
  },
  building_status: {
    type: String,
  },
  location: {
    type: String,
  },
  img_url: {
    type: String,
  },
});

const router = useRouter();
const $q = useQuasar();
const deleted = ref(false);
const isDeleted = ref(false);
const useStore = useUserStore()
const userData = useStore.data

const getImageUrl = (url) => {
  const publicPath = import.meta.env.BASE_URL;
  return `${publicPath}uploads/${url}`;
};

const handleEdit = (id) => {
  router.push("/edit?id=" + id);
};

const handleDelete = async (id) => {


  const res = await api.patch('/remove-building', {
    id: id,
    owner_id: userData.id
  });
  if (res.data[0].st_code == 200) {
    $q.notify({
      position: "top",
      type: "positive",
      message: res.data[0].st_msg,
    });
    isDeleted.value = true;
  } else {
    $q.notify({
      position: "top",
      type: "negative",
      message: res.data[0].st_msg,
    });
  }
};

watchEffect(() => {
  deleted.value = isDeleted.value;
});
</script>
