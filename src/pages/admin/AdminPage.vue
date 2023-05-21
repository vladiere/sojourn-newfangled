<template>
  <div class="absolute-center" style="width: 500px">
    <q-form @submit.prevent="handleSubmit" class="column q-gutter-md">
      <q-input
        square
        filled
        v-model="form.username"
        class="text-black"
        color="black"
        label="Admin Username"
      />
      <q-input
        square
        filled
        v-model="form.password"
        class="text-black"
        color="black"
        label="Admin Password"
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
      <q-btn color="secondary" label="Login" type="submit" style="width: 30%" />
    </q-form>
  </div>
</template>

<script setup>
import { defineComponent, ref } from "vue";
import { useRouter } from "vue-router";
import { useAdminStore } from "src/stores/admin-store";
import { api } from "src/boot/axios";

defineComponent({
  name: "AdminPage",
});

const useStore = useAdminStore();
const router = useRouter()
const form = ref({
  username: "",
  pass: "",
});
const isPwd = ref(true);

const handleSubmit = async () => {
  const res = await api.post("/api/login-admin", form.value);

  if (res.data.length != 0) {
    useStore.setData(res.data)
    router.push('homepage')
  }
};
</script>
