<template>
  <div class="q-pa-md">
    <span class="text-h5">Admins List</span>
    <div
      class="q-pa-md row full-width justify-center items-center text-capitalize"
    >
      <q-form @submit.prevent="handleSubmit" class="row q-gutter-md">
        <q-input color="teal" filled v-model="form.firstname" label="Firstname">
          <template v-slot:prepend>
            <q-icon name="fas fa-user" />
          </template>
        </q-input>
        <q-input color="teal" filled v-model="form.lastname" label="Lastname">
          <template v-slot:prepend>
            <q-icon name="fas fa-user" />
          </template>
        </q-input>
        <q-input color="teal" filled v-model="form.username" label="Username">
          <template v-slot:prepend>
            <q-icon name="fas fa-user-tie" />
          </template>
        </q-input>
        <q-input
          color="teal"
          filled
          v-model="form.password"
          label="Password"
          :type="isPwd ? 'password' : 'text'"
        >
          <template v-slot:prepend>
            <q-icon
              :name="isPwd ? 'visibility_off' : 'visibility'"
              class="cursor-pointer"
              @click="isPwd = !isPwd"
            />
          </template>
        </q-input>
        <q-btn type="submit" color="teal" label="Add admin" />
      </q-form>
    </div>
    <q-table
      flat
      bordered
      title="Admins List"
      :rows="rows"
      :columns="columns"
      row-key="name"
      separator="vertical"
      class="text-capitalize"
      :loading="loading"
      v-model:selectedRow="selectedRow"
    >
      <template v-slot:loading>
        <q-inner-loading showing color="primary" />
      </template>
    </q-table>
  </div>
  <q-dialog v-model="confirm" persistent>
    <q-card>
      <q-card-section class="row items-center">
        <q-avatar icon="warning" color="info" text-color="white" />
        <span class="q-ml-sm"
          >Are you sure you want to proceed with deleting the account for "{{
            selectedRow.name
          }}"?</span
        >
      </q-card-section>

      <q-card-actions align="right">
        <q-btn
          flat
          label="Delete"
          color="negative"
          @click="deleteAccount"
          v-close-popup
        />
        <q-btn flat label="Cancel" color="info" v-close-popup />
      </q-card-actions>
    </q-card>
  </q-dialog>
</template>

<script setup>
import { defineComponent, ref, onMounted, watchEffect } from "vue";
import { api } from "src/boot/axios";
import { useQuasar } from "quasar";

defineComponent({
  name: "AdminsPage",
});
const $q = useQuasar();
const confirm = ref(false);
const loading = ref(false);
const isPwd = ref(true);
const selectedRow = ref([]);
const form = ref({
  firstname: "",
  lastname: "",
  username: "",
  password: "",
});

const columns = [
  {
    name: "firstname",
    align: "center",
    label: "Firstname",
    field: "firstname",
    sortable: true,
  },
  {
    name: "lastname",
    align: "center",
    label: "Lastname",
    field: "lastname",
    sortable: true,
  },
  {
    name: "username",
    align: "center",
    label: "Username",
    field: "username",
    sortable: true,
  },
];

const rows = ref([]);

const getOwners = async () => {
  const params = {
    desc: "admins",
    token: localStorage.getItem("token"),
  };

  const res = await api.get("/api/get-users", {
    params,
  });
  rows.value = res.data;
};

const handleSubmit = async () => {
  const res = await api.post("/api/register-admin", form.value)

  console.log(res.data)

  if (res.data[0].st_code == 200) {
    $q.notify({
      position: 'top',
      type: 'positive',
      message: res.data[0].st_msg
    })
    form.value.firstname = ''
    form.value.lastname = ''
    form.value.username = ''
    form.value.password = ''
    loading.value = true
    setTimeout(() => {
      loading.value = false
    }, 1000);

  } else {
    $q.notify({
      position: 'top',
      type: 'negative',
      message: res.data[0].st_msg
    })
  }

}

onMounted(() => {
  getOwners();
});

watchEffect(() => {
  if (loading.value) {
    getOwners();
  }
})

</script>
