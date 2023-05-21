<template>
  <q-card
    class="my-card"
    flat
    bordered
    style="max-width: 500px; max-height: 350px"
  >
    <q-card-section horizontal>
      <q-card-section class="q-pt-xs">
        <div class="text-overline">{{ date_created }}</div>
        <div class="text-h5 q-mt-sm q-mb-xs">{{ building_name }}</div>
        <div class="text-caption text-grey-10">
          <div class="column justify-center text-capitalize">
            {{ lorem }}
          </div>
        </div>
      </q-card-section>
      <q-card-section class="col-5 flex flex-center">
        <q-img
          class="rounded-borders"
          :src="getImageUrl(img_url)"
          style="max-width: 100%; max-height: 100%"
        />
      </q-card-section>
    </q-card-section>

    <q-separator />

    <q-card-actions>
      <q-icon flat round name="event" style="font-size: 2rem" />
      <q-btn flat> {{ open_hours }} </q-btn>
      <q-btn flat color="black" @click="card = true"> Reserve </q-btn>
    </q-card-actions>
  </q-card>

  <q-dialog v-model="card">
    <q-card class="my-card text-capitalize">
      <q-img :src="getImageUrl(img_url)" style="width: 30%; margin: 15px" />

      <q-card-section>
        <q-btn
          fab
          color="secondary"
          icon="place"
          class="absolute"
          style="top: 0; right: 12px; transform: translateY(-50%)"
        />

        <div class="row no-wrap items-center">
          <div class="col text-h6 ellipsis">{{ building_name }}</div>
          <div
            class="col-auto text-grey text-caption q-pt-md row no-wrap items-center"
          >
            <q-icon name="place" />
            {{ location }}
          </div>
        </div>

        <q-rating v-model="stars" :max="5" size="32px" />
      </q-card-section>

      <q-card-section class="q-pt-none">
        <div class="text-subtitle1">PHP・{{ price }}</div>
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
          icon="event"
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
    <q-card class="bg-info text-white" style="min-width: 300px">
      <q-card-section>
        <div class="text-h6">Reservation</div>
      </q-card-section>

      <q-card-section class="q-pt-none">
        <q-date
          standout
          v-model="form"
          color="info"
          class="text-black"
          :min-date="minDate"
          use-utc
          range
        />
        <q-input
          standout
          v-model="form.total_price"
          label="Total Price"
          readonly
        />
      </q-card-section>
      <q-card-section>
        <div class="column">
          <span class="text-h6">Payment Method</span>
          <div class="q-gutter-sm">
            <q-radio
              v-model="options"
              color="negative"
              checked-icon="task_alt"
              unchecked-icon="panorama_fish_eye"
              val="credit/debit"
              label="Credit/Debit Card"
            />
            <q-radio
              v-model="options"
              color="negative"
              checked-icon="task_alt"
              unchecked-icon="panorama_fish_eye"
              val="gcash"
              label="GCash"
            />
          </div>
          <div class="row q-gutter-md" v-if="options == 'credit/debit'">
            <div class="col">
              <q-input
                maxlength="4"
                square
                outlined
                color="black"
                v-model="digits[0]"
                label="Digit 1"
              />
            </div>

            <div class="col">
              <q-input
                maxlength="4"
                square
                outlined
                color="black"
                v-model="digits[1]"
                label="Digit 2"
              />
            </div>
            <div class="col">
              <q-input
                maxlength="4"
                square
                outlined
                color="black"
                v-model="digits[2]"
                label="Digit 3"
              />
            </div>
            <div class="col">
              <q-input
                maxlength="4"
                square
                outlined
                color="black"
                v-model="digits[3]"
                label="Digit 4"
              />
            </div>
          </div>
          <div class="" v-if="options == 'gcash'">
            <q-input
              square
              outlined
              color="black"
              v-model="gcash"
              label="GCash"
              lazy-rule
              :rules="[
                (val) => regex.test(val) || 'Please enter a valid number',
              ]"
            />
          </div>
        </div>
      </q-card-section>

      <q-card-actions align="right" class="bg-white text-teal">
        <q-btn
          flat
          label="Set schedule"
          @click="handleRent(building_id)"
          :disable="isSucces"
        />
        <q-btn flat label="Cancel" v-close-popup />
      </q-card-actions>
    </q-card>
  </q-dialog>
</template>

<script setup>
import { defineComponent, ref, watchEffect, computed } from "vue";
import { useQuasar } from "quasar";
import { api } from "src/boot/axios";
import { useUserStore } from "src/stores/user-store";
import { useRouter } from "vue-router";

defineComponent({
  name: "BuildingCardCustomer",
});

const $q = useQuasar();
const useStore = useUserStore();

const props = defineProps({
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

const options = ref('credit/debit');
const digits = ref(['', '', '', ''])
const gcash = ref(null)
const regex = /^(\+?63|0)9\d{9}$/
const card = ref(false);
const reserve = ref(false);
const isSucces = ref(false);
const stars = ref(5);
const useData = useStore.data;

const form = ref({
  bid: 0,
  cid: 0,
  total_price: 0,
  pay_method: '',
  number: ''
});
const router = useRouter();

const getImageUrl = (url) => {
  const publicPath = import.meta.env.BASE_URL;
  return `${publicPath}uploads/${url}`;
};

const today = new Date();
today.setUTCHours(0, 0, 0, 0); // Set the time to 00:00:00 in UTC
const minDate = today.toISOString().split("T")[0];

const handleRent = async (id) => {
  form.value.bid = id;
  form.value.cid = useData.id;
  form.value.pay_method = options.value
  form.value.number = gcash.value || digits.value
  
  const res = await api.post("/rent-building", form.value);

  if (res.data[0].st_code == 200) {
    $q.notify({
      position: "top",
      type: "positive",
      message: res.data[0].st_msg,
    });
    isSucces.value = true;

  }
};

watchEffect(() => {
  if (form.value !== "") {
    const oneDayPrice = props.price;

    const startDate = form.value.from;
    const endDate = form.value.to;

    const oneDay = 24 * 60 * 60 * 1000;
    const start = new Date(startDate);
    const end = new Date(endDate);
    const numberOfDays = Math.round(Math.abs((start - end) / oneDay));

    const totalPrice = numberOfDays * oneDayPrice;

    form.value.total_price = totalPrice ? totalPrice : 0;
  }
});

const lorem = ref(
  "Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique optio sapiente, tempora dolorem est nisi perspiciatis sed vero obcaecati laboriosam nostrum voluptas sequi."
);
</script>
