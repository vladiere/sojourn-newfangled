<template>
  <q-page padding>
    <div class="row full-width justify-center items-center">
      <div class="column q-gutter-md" style="width: 50%">
        <span class="text-h4">Payment Procedure</span>
        <div class="q-gutter-sm">
          <q-radio
            v-model="options"
            color="positive"
            checked-icon="task_alt"
            unchecked-icon="panorama_fish_eye"
            val="credit/debit"
            label="Credit/Debit Card"
          />
          <q-radio
            v-model="options"
            color="positive"
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
                val => regex.test(val) || 'Please enter a valid number'
              ]"
            />
        </div>
        <q-btn flat label="Submit" style="width:30%"/>
      </div>
    </div>
  </q-page>
</template>

<script setup>
import { defineComponent, ref } from "vue";

defineComponent({
  name: "PaymentPage",
});

const options = ref('credit/debit');
const digits = ref(['', '', '', ''])
const gcash = ref(null)
const regex = /^(\+?63|0)9\d{9}$/
</script>
