<template>
  <q-page padding>
    <div class="q-pa-lg row justify-center items-center full-width">
      <div
        class="shadow-1 column justify-center items-center"
        style="width: 90%"
      >
        <form
          class="q-my-lg q-px-lg row full-width"
          @submit.prevent="handleAddBuilding"
        >
          <div class="col q-mr-md">
            <q-file
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
              <q-input outlined color="teal" v-model="form.city" label="City" />
            </div>
            <div class="col q-my-md">
              <q-input
                outlined
                color="teal"
                v-model="form.province"
                label="Province"
              />
            </div>
            <div class="col">
              <q-input
                outlined
                color="teal"
                v-model="form.brgy"
                label="Baranggay"
              />
            </div>
            <div class="col q-my-md">
              <q-input
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
          :disable="done"
          label="Add Building"
          class="q-mb-md"
          @click="handleAddBuilding"
        />
      </div>
    </div>
  </q-page>
</template>

<script setup>
import { defineComponent, ref, watchEffect } from "vue";
import { useQuasar } from "quasar";
import { api } from "src/boot/axios";
import { useUserStore } from "src/stores/user-store";

defineComponent({
  name: "AddBuilding",
});

const $q = useQuasar();
const useStore = useUserStore();
const userData = useStore.data;
const file = ref(null);
const imgUrl = ref("");
const done = ref(false)
const form = ref({
  id: "",
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
  description: 0,
});

const previewUrl = ref(null);

const checkFileType = (files) => {
  return files.filter(
    (file) =>
      file.type === "image/png" ||
      file.type === "image/jpeg" ||
      (file.type === "image/jpg" && file.size < 3048)
  );
};

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

const handleAddBuilding = async () => {
  form.value.id = userData.id;
  form.value.image = imgUrl.value;
  try {

    const res = await api.post('/add-building', form.value)
    console.log(res.data[0].st_code)
    if (res.data[0].st_code == 200) {
      $q.notify({
        position: 'top',
        type: 'positive',
        message: res.data[0].st_msg
      })
      done.value = true
    } else {
      $q.notify({
        position: 'top',
        type: 'negative',
        message: res.data[0].st_msg
      })
    }

    form.value.title = ''
    form.value.price = ''
    form.value.openhours = ''
    form.value.city = ''
    form.value.province = ''
    form.value.brgy = ''
    form.value.street = ''
    form.value.postal_code = ''
    form.value.status = ''


  } catch (error) {
    console.error(error);
  }
};

</script>
