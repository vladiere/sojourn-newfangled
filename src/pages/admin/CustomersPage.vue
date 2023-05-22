<template>
  <div class="q-pa-md">
    <span class="text-h5">Customers List</span>
    <q-table
      flat
      bordered
      title="Customers List"
      :rows="rows"
      :columns="columns"
      row-key="name"
      separator="vertical"
      class="text-capitalize"
      v-model:selectedRow="selectedRow"
    />
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

defineComponent({
  name: "CustomersPage",
});

const confirm = ref(false);
const selectedRow = ref([]);

const columns = [
  {
    name: "firstname",
    align: "left",
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
    align: "right",
    label: "Username",
    field: "username",
    sortable: true,
  },
  {
    name: "email",
    align: "right",
    label: "Email",
    field: "email",
    sortable: true,
  },
  {
    name: "birthdate",
    align: "right",
    label: "Birthdate",
    field: "birthdate",
    sortable: true,
  },
  {
    name: "phone_number",
    align: "right",
    label: "Phone Number",
    field: "phone_number",
    sortable: true,
  },
  {
    name: "created_at",
    align: "right",
    label: "date registered",
    field: "created_at",
    sortable: true,
  },
  {
    name: "updated_at",
    align: "right",
    label: "Date updated",
    field: "updated_at",
    sortable: true,
  },
];

const rows = ref([]);

const getOwners = async () => {
  const params = {
    desc: "customers",
    token: localStorage.getItem("token"),
  };

  const res = await api.get("/api/get-users", {
    params,
  });
  rows.value = res.data;

};

const showDialog = (row) => {
  // selectedRow.value = row;

  console.log(row);
  confirm.value = true;
};

onMounted(() => {
  getOwners();

  console.log(selectedRow.value)
});
</script>
