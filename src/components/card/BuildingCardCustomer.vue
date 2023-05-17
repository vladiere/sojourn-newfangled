<template>
  <div class="q-mt-md row full-width q-gutter-md">
    <div class="wrap-sm row justify-center items-center q-gutter-md">
      <q-card class="my-card" flat bordered style="max-width: 600px">
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
          <q-icon flat round name="event" style="font-size: 2rem" />
          <q-btn flat> 7:30PM </q-btn>
          <q-btn flat color="black" @click="card = true"> Reserve </q-btn>
        </q-card-actions>
      </q-card>
      <q-card class="my-card" flat bordered style="max-width: 600px">
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
          <q-icon flat round name="event" style="font-size: 2rem" />
          <q-btn flat> 7:30PM </q-btn>
          <q-btn flat color="black" @click="card = true"> Reserve </q-btn>
        </q-card-actions>
      </q-card>
      <q-card class="my-card" flat bordered style="max-width: 600px">
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
          <q-icon flat round name="event" style="font-size: 2rem" />
          <q-btn flat> 7:30PM </q-btn>
          <q-btn flat color="black" @click="card = true"> Reserve </q-btn>
        </q-card-actions>
      </q-card>
      <q-card class="my-card" flat bordered style="max-width: 600px">
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
          <q-icon flat round name="event" style="font-size: 2rem" />
          <q-btn flat> 7:30PM </q-btn>
          <q-btn flat color="black" @click="card = true"> Reserve </q-btn>
        </q-card-actions>
      </q-card>
      <q-card class="my-card" flat bordered style="max-width: 600px">
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
          <q-icon flat round name="event" style="font-size: 2rem" />
          <q-btn flat> 7:30PM </q-btn>
          <q-btn flat color="black" @click="card = true"> Reserve </q-btn>
        </q-card-actions>
      </q-card>
      <q-card class="my-card" flat bordered style="max-width: 600px">
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
          <q-icon flat round name="event" style="font-size: 2rem" />
          <q-btn flat> 7:30PM </q-btn>
          <q-btn flat color="black" @click="card = true"> Reserve </q-btn>
        </q-card-actions>
      </q-card>
    </div>
  </div>

  <q-dialog v-model="card">
    <q-card class="my-card">
      <q-img src="https://cdn.quasar.dev/img/chicken-salad.jpg" />

      <q-card-section>
        <q-btn
          fab
          color="secondary"
          icon="place"
          class="absolute"
          style="top: 0; right: 12px; transform: translateY(-50%)"
        />

        <div class="row no-wrap items-center">
          <div class="col text-h6 ellipsis">Villa Marga</div>
          <div
            class="col-auto text-grey text-caption q-pt-md row no-wrap items-center"
          >
            <q-icon name="place" />
            Tagaytay, nasugbu, HWY
          </div>
        </div>

        <q-rating v-model="stars" :max="5" size="32px" />
      </q-card-section>

      <q-card-section class="q-pt-none">
        <div class="text-subtitle1">$・Italian, Cafe</div>
        <div class="text-caption text-grey">
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus
          voluptatem dolores explicabo non earum! Voluptatum.
        </div>
      </q-card-section>

      <q-separator />

      <q-card-actions align="right">
        <q-btn
          v-close-popup
          flat
          color="secondary"
          label="Reserve"
          @click="reserve = true"
        />
        <q-btn
          v-close-popup
          flat
          color="secondary"
          round
          icon="event"
          readonly
        />
      </q-card-actions>
    </q-card>
  </q-dialog>

  <q-dialog
    v-model="reserve"
    persistent
    transition-show="scale"
    transition-hide="scale"
  >
    <q-card class="bg-info text-white" style="width: 300px">
      <q-card-section>
        <div class="text-h6">Reservation</div>
      </q-card-section>

      <q-card-section class="q-pt-none">
        <q-input standout v-model="form.date_in" type="date" label="Date in" />
        <q-input
          standout
          v-model="form.date_out"
          type="date"
          class="q-my-md"
          label="Date out"
        />
        <q-input
          standout
          v-model="form.total_price"
          label="Total Price"
          readonly
        />
      </q-card-section>

      <q-card-actions align="right" class="bg-white text-teal">
        <q-btn flat label="Set schedule" v-close-popup />
        <q-btn flat label="Cancel" v-close-popup />
      </q-card-actions>
    </q-card>
  </q-dialog>
</template>

<script setup>
import { defineComponent, ref, watchEffect } from "vue";

defineComponent({
  name: "BuildingCardCustomer",
});

const card = ref(false);
const reserve = ref(false);
const stars = ref(3);
const form = ref({
  date_in: "",
  date_out: "",
  total_price: 0,
});

const calculatePrice = () => {
  const oneDayPrice = 1500;

  const startDate = form.value.date_in;
  const endDate = form.value.date_out;

  const oneDay = 24 * 60 * 60 * 1000;
  const start = new Date(startDate);
  const end = new Date(endDate);
  const numberOfDays = Math.round(Math.abs((start - end) / oneDay));

  const totalPrice = numberOfDays * oneDayPrice;

  form.value.total_price = totalPrice ? totalPrice : 0;
};

watchEffect(() => {
  calculatePrice();
});

const lorem = ref(
  "Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique optio sapiente, tempora dolorem est nisi perspiciatis sed vero obcaecati laboriosam nostrum voluptas sequi quasi numquam unde nemo recusandae iste, velit atque expedita, cum suscipit dolorum aliquid tenetur? Fugit, minima provident."
);
</script>
