<template>
  <q-page padding>
    <div class="q-pa-lg row justify-center items-center full-width">
      <div
        class="shadow-1 column justify-center items-center text-capitalize"
        style="width: 90%"
      >
        <form
          class="q-my-lg q-px-lg row full-width"
          @submit.prevent="handleAddBuilding"
        >
          <div class="col q-mr-md">
            <q-file
              disable
              color="teal"
              filled
              v-model="file"
              type="file"
              accept="image/png, image/jpeg, image/jpg"
              label="Building Image"
              :rules="checkFileType"
              @input="handleFileUpload"
            >
              <template v-slot:prepend>
                <q-icon name="cloud_upload" />
              </template>
            </q-file>
            <div v-if="previewUrl" class="row justify-center">
              <img :src="previewUrl" alt="Preview" />
            </div>
          </div>
          <div class="col column">
            <div class="col q-mb-md">
              <q-input
                readonly
                outlined
                color="teal"
                v-model="form.title"
                label="Building Name"
              />
            </div>
            <div class="col">
              <q-input
                type="number"
                outlined
                color="teal"
                v-model="form.price"
                label="Price"
              >
                <template v-slot:append>
                  <q-icon name="fas fa-peso-sign" />
                </template>
              </q-input>
            </div>
            <div class="col q-my-md">
              <q-input
                label="Time"
                outlined
                v-model="form.openhours"
                mask="time"
                :rules="['time']"
              >
                <template v-slot:append>
                  <q-icon name="access_time" class="cursor-pointer">
                    <q-popup-proxy
                      cover
                      transition-show="scale"
                      transition-hide="scale"
                    >
                      <q-time
                        color="black"
                        text-color="info"
                        v-model="form.openhours"
                      >
                        <div class="row items-center justify-end">
                          <q-btn
                            v-close-popup
                            label="Close"
                            color="dark"
                            flat
                          />
                        </div>
                      </q-time>
                    </q-popup-proxy>
                  </q-icon>
                </template>
              </q-input>
            </div>
            <div class="col">
              <q-input
                readonly
                outlined
                color="teal"
                v-model="form.city"
                label="City"
              />
            </div>
            <div class="col q-my-md">
              <q-input
                readonly
                outlined
                color="teal"
                v-model="form.province"
                label="Province"
              />
            </div>
            <div class="col">
              <q-input
                readonly
                outlined
                color="teal"
                v-model="form.brgy"
                label="Baranggay"
              />
            </div>
            <div class="col q-my-md">
              <q-input
                readonly
                outlined
                color="teal"
                v-model="form.street"
                label="Street"
              />
            </div>
            <div class="col">
              <div class="row">
                <div class="col q-mr-md">
                  <q-input
                    readonly
                    outlined
                    color="teal"
                    v-model="form.postal_code"
                    type="number"
                    label="Postal Code"
                  />
                </div>
                <div class="col">
                  <q-input
                    outlined
                    color="teal"
                    v-model="form.status"
                    label="Status"
                  />
                </div>
              </div>
            </div>
          </div>
        </form>
        <q-btn
          label="Update Building"
          class="q-mb-md"
          :disable="isUpdated"
          @click="handleUpdateBuilding"
        />
      </div>
    </div>
  </q-page>
</template>

<script setup>
import { defineComponent, ref, onMounted, watchEffect } from "vue";
import { useRouter } from "vue-router";
import { useQuasar } from 'quasar'
import { api } from "src/boot/axios";
import { useUserStore } from "src/stores/user-store";

defineComponent({
  name: "EditBuilding",
});

const router = useRouter();
const buildingData = ref({});
const location = ref([]);
const previewUrl = ref(null);
const file = ref(null);
const imgUrl = ref("");
const isUpdated = ref(false)
const $q = useQuasar();
const useStore = useUserStore()
const userData = useStore.data

const form = ref({
  id: 0,
  image: "",
  title: "",
  price: "",
  openhours: "",
  city: "",
  province: "",
  brgy: "",
  street: "",
  postal_code: "",
  status: "",
  building_id: 0,
  description: 1,
});

const handleFileUpload = (event) => {
  const file = event.target.files[0];
  file.value = file;
  previewFile(file);
};

const previewFile = (file) => {
  const reader = new FileReader();
  reader.onload = () => {
    previewUrl.value = reader.result;
  };

  reader.readAsDataURL(file);

  setTimeout(() => {
    addImage();
  }, 500);
};

const addImage = async () => {
  try {
    const formData = new FormData();
    formData.append("file", file.value);

    const res = await api.post("/add-image", formData);
    imgUrl.value = res.data;
  } catch (error) {
    console.error(error);
  }
};

const getBuilding = async () => {

  const params = {
    search: "",
    id: router.currentRoute.value.query.id,
    owner_id: userData.id
  };

  const publicPath = import.meta.env.BASE_URL;
  const res = await api.get("/get-buildings", { params });

  location.value = res.data[0][0].location.split(",");

  buildingData.value = res.data[0][0];

  form.value.title = buildingData.value.building_name
  form.value.status = buildingData.value.building_status
  form.value.openhours = buildingData.value.open_hours
  form.value.price = buildingData.value.price
  form.value.city = location.value[0]
  form.value.province = location.value[1]
  form.value.brgy = location.value[2]
  form.value.street = location.value[3]
  form.value.postal_code = parseInt(location.value[4])
  form.value.building_id = buildingData.value.building_id
  previewUrl.value = `${publicPath}uploads/${buildingData.value.img_url}`
};

const handleUpdateBuilding = async () => {
  try {
    const res = await api.post('/add-building', form.value)
    console.log(res.data)
    if (res.data[0].st_code == 200) {
      $q.notify({
        position: 'top',
        type: 'positive',
        message: res.data[0].st_msg
      })
      isUpdated.value = true
    } else {
      $q.notify({
        position: 'top',
        type: 'negative',
        message: res.data[0].st_msg
      })
    }
  } catch (error) {
    console.error(error)
  }

}

onMounted(() => {
  setTimeout(() => {
    getBuilding();
  }, 500);
});

watchEffect(() => {});
</script>
