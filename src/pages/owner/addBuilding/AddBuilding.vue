<template>
  <q-page padding>
    <div class="q-pa-lg row justify-center items-center full-width">
      <div
        class="shadow-1 column justify-center items-center"
        style="width: 90%"
      >
        <div class="q-my-lg q-px-lg row full-width">
          <div class="col q-mr-md">
            <q-file
              color="teal"
              filled
              v-model="file"
              accept="image/png, image/jpeg, image/jpg"
              label="Label"
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
            <div class="col">
              <q-input outlined color="teal" v-model="text" label="Price">
                <template v-slot:append>
                  <q-icon name="fas fa-peso-sign" />
                </template>
              </q-input>
            </div>
            <div class="col q-my-md">
              <q-input
                outlined
                color="teal"
                type="time"
                v-model="text"
                label="Open Hours"
              >
                <template v-slot:append>
                  <q-icon name="fas fa-clock" />
                </template>
              </q-input>
            </div>
            <div class="col">
              <q-input outlined color="teal" v-model="text" label="City" />
            </div>
            <div class="col q-my-md">
              <q-input outlined color="teal" v-model="text" label="Province" />
            </div>
            <div class="col">
              <q-input outlined color="teal" v-model="text" label="Baranggay" />
            </div>
            <div class="col q-my-md">
              <q-input outlined color="teal" v-model="text" label="Street" />
            </div>
            <div class="col">
              <q-input outlined color="teal" v-model="text" label="Status" />
            </div>
          </div>
        </div>
        <q-btn label="Add Building" class="q-mb-md" />
      </div>
    </div>
  </q-page>
</template>

<script setup>
import { defineComponent, ref, watchEffect } from "vue";
import { useQuasar } from "quasar";

defineComponent({
  name: "AddBuilding",
});

const $q = useQuasar();
const file = ref(null);
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
</script>
