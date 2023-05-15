<template>
  <q-page padding>
    <div class="q-pa-lg row justify-center items-center full-width">
      <div
        class="bg-blue-3 column justify-center items-center"
        style="width: 50%"
      >
        <div
          class="column q-gutter-lg q-my-lg"
          style="max-width: 100%; max-height: 60%"
        >
          <q-uploader
            text-color="black"
            url="http://localhost:9000/src/upload"
            secondary
            :filter="checkFileType"
          />
          <q-input
            outlined
            filled
            v-model="text"
            label="Price"
            lazy-rules
            :rules="[
              val => val.regex(/[0-9]/) || 'Numbers only'
            ]"
          />
          <q-input outlined filled v-model="text" label="Open Hours" type="time" />
          <q-input outlined filled v-model="text" label="Location" />
          <q-input outlined filled v-model="text" label="Status" />
        </div>
      </div>
    </div>
  </q-page>
</template>

<script setup>
import { defineComponent } from "vue";
import { useQuasar } from "quasar";

defineComponent({
  name: "AddBuilding",
});

const $q = useQuasar();

const checkFileType = (files) => {
  return files.filter(
    (file) =>
      file.type === "image/png" ||
      file.type === "image/jpeg" ||
      (file.type === "image/jpg" && file.size < 3048)
  );
};
</script>
