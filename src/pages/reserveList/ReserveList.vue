<template>
  <q-page padding>
    <div class="row full-width justify-center items-center">
      <div
        class="q-gutter-md column items-center"
        style="width: 50%"
      >
        <div class="column items-center text-h6 q-pa-md shadow-16">
          <div class="col">
            <q-avatar class="q-mr-md">
              <img src="https://cdn.quasar.dev/img/avatar.png" />
            </q-avatar>
            <span>John Añora</span>
          </div>
          <div class="col column text-subtitle1">
            <span>Building number: 16132</span>
            <span>Price: P12309</span>
            <span>Date In: May 17, 2023 01:00 pm</span>
            <span>Date Out: May 22, 2023 01:00 pm</span>
          </div>
          <div class="col q-gutter-md q-mt-md">
            <q-btn round color="secondary" icon="check" />
            <q-btn round color="negative" icon="close" />
          </div>
        </div>
      </div>
    </div>
  </q-page>
</template>

<script setup>
import { defineComponent } from "vue";

defineComponent({
  name: "ReserveList",
});
</script>
