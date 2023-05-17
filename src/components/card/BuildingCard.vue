<template>
  <div
    class="q-mt-xl row full-width q-gutter-md"
  >
    <div class="wrap-sm row justify-center items-center q-gutter-md" >
      <q-card class="my-card" flat bordered style="max-width: 600px;">
        <q-card-section horizontal>
          <q-card-section class="q-pt-xs">
            <div class="text-overline">Overline</div>
            <div class="text-h5 q-mt-sm q-mb-xs">Title</div>
            <div class="text-caption text-grey-10">
              {{ lorem }}
            </div>
          </q-card-section>

          <q-card-section class="col-5 flex flex-center">
            <q-img
              class="rounded-borders"
              src="https://cdn.quasar.dev/img/parallax2.jpg"
            />
          </q-card-section>
        </q-card-section>

        <q-separator />

        <q-card-actions>

          <q-btn flat> Edit </q-btn>
          <q-btn flat align="right" color="negative"> Remove </q-btn>
        </q-card-actions>
      </q-card>
      <q-card class="my-card" flat bordered style="max-width: 600px;">
        <q-card-section horizontal>
          <q-card-section class="q-pt-xs">
            <div class="text-overline">Overline</div>
            <div class="text-h5 q-mt-sm q-mb-xs">Title</div>
            <div class="text-caption text-grey-10">
              {{ lorem }}
            </div>
          </q-card-section>

          <q-card-section class="col-5 flex flex-center">
            <q-img
              class="rounded-borders"
              src="https://cdn.quasar.dev/img/parallax2.jpg"
            />
          </q-card-section>
        </q-card-section>

        <q-separator />

        <q-card-actions>

          <q-btn flat> Edit </q-btn>
          <q-btn flat color="negative"> Remove </q-btn>
        </q-card-actions>
      </q-card>
      <q-card class="my-card" flat bordered style="max-width: 600px;">
        <q-card-section horizontal>
          <q-card-section class="q-pt-xs">
            <div class="text-overline">Overline</div>
            <div class="text-h5 q-mt-sm q-mb-xs">Title</div>
            <div class="text-caption text-grey-10">
              {{ lorem }}
            </div>
          </q-card-section>

          <q-card-section class="col-5 flex flex-center">
            <q-img
              class="rounded-borders"
              src="https://cdn.quasar.dev/img/parallax2.jpg"
            />
          </q-card-section>
        </q-card-section>

        <q-separator />

        <q-card-actions>

          <q-btn flat> Edit </q-btn>
          <q-btn flat color="negative"> Remove </q-btn>
        </q-card-actions>
      </q-card>
      <q-card class="my-card" flat bordered style="max-width: 600px;">
        <q-card-section horizontal>
          <q-card-section class="q-pt-xs">
            <div class="text-overline">Overline</div>
            <div class="text-h5 q-mt-sm q-mb-xs">Title</div>
            <div class="text-caption text-grey-10">
              {{ lorem }}
            </div>
          </q-card-section>

          <q-card-section class="col-5 flex flex-center">
            <q-img
              class="rounded-borders"
              src="https://cdn.quasar.dev/img/parallax2.jpg"
            />
          </q-card-section>
        </q-card-section>

        <q-separator />

        <q-card-actions>

          <q-btn flat> Edit </q-btn>
          <q-btn flat color="negative"> Remove </q-btn>
        </q-card-actions>
      </q-card>
      <q-card class="my-card" flat bordered style="max-width: 600px;">
        <q-card-section horizontal>
          <q-card-section class="q-pt-xs">
            <div class="text-overline">Overline</div>
            <div class="text-h5 q-mt-sm q-mb-xs">Title</div>
            <div class="text-caption text-grey-10">
              {{ lorem }}
            </div>
          </q-card-section>

          <q-card-section class="col-5 flex flex-center">
            <q-img
              class="rounded-borders"
              src="https://cdn.quasar.dev/img/parallax2.jpg"
            />
          </q-card-section>
        </q-card-section>

        <q-separator />

        <q-card-actions>

          <q-btn flat> Edit </q-btn>
          <q-btn flat color="negative"> Remove </q-btn>
        </q-card-actions>
      </q-card>
      <q-card class="my-card" flat bordered style="max-width: 600px;">
        <q-card-section horizontal>
          <q-card-section class="q-pt-xs">
            <div class="text-overline">Overline</div>
            <div class="text-h5 q-mt-sm q-mb-xs">Title</div>
            <div class="text-caption text-grey-10">
              {{ lorem }}
            </div>
          </q-card-section>

          <q-card-section class="col-5 flex flex-center">
            <q-img
              class="rounded-borders"
              src="https://cdn.quasar.dev/img/parallax2.jpg"
            />
          </q-card-section>
        </q-card-section>

        <q-separator />

        <q-card-actions>

          <q-btn flat> Edit </q-btn>
          <q-btn flat color="negative"> Remove </q-btn>
        </q-card-actions>
      </q-card>
    </div>
  </div>
</template>

<script setup>
import { defineComponent, ref } from "vue";

defineComponent({
  name: "BuildingCard",
});

const lorem = ref(
  "Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique optio sapiente, tempora dolorem est nisi perspiciatis sed vero obcaecati laboriosam nostrum voluptas sequi quasi numquam unde nemo recusandae iste, velit atque expedita, cum suscipit dolorum aliquid tenetur? Fugit, minima provident."
);
</script>
