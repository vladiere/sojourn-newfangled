<template>
  <div class="bg-primary fullscreen">
    <div
      class="column full-width justify-center items-center q-gutter-lg q-mt-xl"
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
        class="q-gutter-md text-capitalize"
        style="width: 40%"
      >
        <div class="row">
          <div class="col q-mr-md">
            <q-input
              square
              standout="bg-teal text-white"
              v-model="form.firtname"
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
              v-model="form.number"
              label="Phone Number"
            />
          </div>
          <div class="col">
            <q-input
              type="date"
              square
              standout="bg-teal text-white"
              v-model="form.birtdate"
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
        <div class="text-black">
          <q-radio
            v-model="role"
            checked-icon="task_alt"
            unchecked-icon="panorama_fish_eye"
            val="owner"
            label="owner"
            color="teal"
          />
          <q-radio
            v-model="role"
            checked-icon="task_alt"
            unchecked-icon="panorama_fish_eye"
            val="customer"
            label="customer"
            color="teal"
          />
        </div>
        <q-btn label="Register" flat to="register" />
      </form>
    </div>
  </div>
</template>

<script setup>
import { defineComponent, ref } from "vue";
import { useRouter } from "vue-router";

defineComponent({
  name: "RegisterPage",
});

const isPwd = ref(true);
const role = ref('');
const router = useRouter()
const form = ref({
  username: "",
  password: "",
});

const pathTo = (path) => {
  router.push(path);
}
</script>
