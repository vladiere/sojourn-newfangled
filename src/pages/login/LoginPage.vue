<template>
  <div class="bg-primary fullscreen">
    <div
      class="column full-width justify-center items-center q-gutter-lg q-mt-lg"
    >
      <img
        src="https://cdn.discordapp.com/attachments/1091354250958868494/1107660600420618320/sojourn.png"
        alt=""
        style="width: 20rem; object-fit: contain"
      />
      <form
        @submit.prevent="handleSubmit"
        class="q-gutter-md"
        style="width: 30%"
      >
        <q-input
          square
          standout="bg-teal text-white"
          v-model="form.username"
          label="Email or Username"
        />
        <div class="row full-width justify-end">
          <q-btn label="Forgot Password" flat @click="dialog = true" />
        </div>
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
        <q-btn color="secondary" type="submit" label="Login" />
        <q-btn label="Register" flat to="register" />
      </form>
    </div>
  </div>
  <q-dialog v-model="dialog" persistent>
    <q-card style="min-width: 350px">
      <q-card-section>
        <div class="text-h6">Your recovery Email address</div>
      </q-card-section>

      <q-card-section class="q-pt-none">
        <q-input
          dense
          v-model="address"
          autofocus
          @keyup.enter="prompt = false"
        />
      </q-card-section>

      <q-card-actions align="right" class="text-black">
        <q-btn flat label="Cancel" v-close-popup />
        <q-btn flat label="Send Code" @click="handleRecovery" />
      </q-card-actions>
    </q-card>
  </q-dialog>
</template>

<script setup>
import { defineComponent, ref } from "vue";
import { api } from "src/boot/axios";
import { useRouter } from "vue-router";
import { useUserStore } from "src/stores/user-store";
import { useQuasar } from "quasar";

defineComponent({
  name: "LoginPage",
});

const isPwd = ref(true);
const dialog = ref(false);
const form = ref({
  username: "",
  password: "",
});

const useStore = useUserStore();
const router = useRouter();
const address = ref("");
const $q = useQuasar();

const handleSubmit = async () => {
  await api.post("/login", form.value).then((res) => {
    if (res.data.status == 200) {
      useStore.setUserData(res.data.user);
      localStorage.setItem("token", res.data.token);

      if (res.data.user.st_role === "owner") {
        router.push("/owner");
      } else {
        router.push("/customer");
      }
    } else {
      $q.notify({
        position: "top",
        type: "warning",
        message: res.data.message,
      });
    }
  });
};

const handleRecovery = () => {};
</script>
