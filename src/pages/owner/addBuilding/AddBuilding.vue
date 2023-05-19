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
              <q-input outlined color="teal" v-model="form.price" label="Price">
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
                <div class="col">
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
const form = ref({
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
};

const handleAddBuilding = async () => {
  try {
    const formData = new FormData();
    
    formData.append("image", file.value);
    formData.append("id", userData.id);
    formData.append("title", form.value.title);
    formData.append("price", form.value.price);
    formData.append("openhours", form.value.openhours);
    formData.append("city", form.value.city);
    formData.append("province", form.value.province);
    formData.append("brgy", form.value.brgy);
    formData.append("street", form.value.street);
    formData.append("status", form.value.status);
    formData.append("postal_code", form.value.postal_code);
    formData.append("building_id", form.value.building_id);
    formData.append("description", form.value.description);

    await api.post("/add-building", formData, {
      headers: {
        "Content-Type": "multipart/form-data",
      },
    });

    form.value = {
      title: "",
      price: "",
      openhours: "",
      city: "",
      province: "",
      brgy: "",
      street: "",
      status: "",
    };
    file.value = null;

    $q.notify({
      message: "Building added successfully",
      type: "positive",
    });
  } catch (error) {
    console.error(error);
    $q.notify({
      message: "Failed to add building",
      type: "negative",
    });
  }
};
</script>
