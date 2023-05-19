<template>
  <div class="bg-primary fullscreen">
    <q-scroll-area style="height: 100vh">
      <div
        class="column full-width justify-center items-center q-gutter-lg q-mb-xl"
      >
        <img
          class="cursor-pointer"
          @click="pathTo('/')"
          src="https://cdn.discordapp.com/attachments/1091354250958868494/1107660600420618320/sojourn.png"
          alt=""
          style="width: 20rem; object-fit: contain"
        />
        <form
          @submit.prevent="handleSubmit"
          class="q-gutter-md"
          style="width: 40%"
        >
          <div class="row">
            <div class="col q-mr-md">
              <q-input
                square
                standout="bg-teal text-white"
                v-model="form.firstname"
                label="Firstname"
              />
            </div>
            <div class="col">
              <q-input
                square
                standout="bg-teal text-white"
                v-model="form.lastname"
                label="Lastname"
              />
            </div>
          </div>
          <div class="row">
            <div class="col q-mr-md">
              <q-input
                square
                standout="bg-teal text-white"
                v-model="form.phone_number"
                label="Phone Number"
                lazy-rules
                :rules="[
                  (val) => regex.test(val) || 'Please enter a valid number',
                ]"
              />
            </div>
            <div class="col">
              <q-input
                type="date"
                square
                standout="bg-teal text-white"
                v-model="form.birthdate"
                label="Birthdate"
              />
            </div>
          </div>
          <q-input
            square
            standout="bg-teal text-white"
            v-model="form.email"
            label="Email"
          />
          <q-input
            square
            standout="bg-teal text-white"
            v-model="form.username"
            label="Username"
          />
          <q-input
            square
            standout="bg-teal text-white"
            v-model="form.password"
            label="Password"
            :type="isPwd ? 'password' : 'text'"
          >
            <template v-slot:append>
              <q-icon
                :name="isPwd ? 'visibility_off' : 'visibility'"
                class="cursor-pointer"
                @click="isPwd = !isPwd"
              />
            </template>
          </q-input>
          <div class="text-black row items-center">
            <span>Register as?</span>
            <q-radio
              v-model="form.role"
              checked-icon="task_alt"
              unchecked-icon="panorama_fish_eye"
              val="owner"
              label="owner"
              color="teal"
            />
            <q-radio
              v-model="form.role"
              checked-icon="task_alt"
              unchecked-icon="panorama_fish_eye"
              val="customer"
              label="customer"
              color="teal"
            />
          </div>
          <q-separator />
          <q-btn label="Register" color="info" type="submit" />
        </form>
      </div>
    </q-scroll-area>
  </div>
</template>

<script setup>
import { defineComponent, ref } from "vue";
import { useRouter } from "vue-router";
import { api } from "src/boot/axios";
import { useQuasar } from "quasar";

defineComponent({
  name: "RegisterPage",
});

const $q = useQuasar();

const regex = /^(09|\+639|639)\d{8}$/;
const isPwd = ref(true);
const router = useRouter();
const form = ref({
  firstname: "",
  lastname: "",
  phone_number: "",
  birthdate: "",
  email: "",
  username: "",
  password: "",
  role: "",
});

const handleSubmit = async () => {
  console.log(form.value);

  await api
    .post("/register", form.value)
    .then((res) => {
      console.log(res.data)
      if (res.data[0].st_code == 200) {
        $q.notify({
          position: 'top',
          type: 'positive',
          message: 'Registration successful'
        })

        $q.loading.show()

        setTimeout(() => {
          $q.loading.hide()
          router.push('/')
        }, 500);
      } else {
        $q.notify({
          position: 'top',
          type: 'negative',
          message: res.data[0].st_msg
        })}
    })
    .catch((err) => console.log(err.message));
};


const pathTo = (path) => {
  router.push(path);
};
</script>
