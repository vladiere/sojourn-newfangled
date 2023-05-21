import { defineStore } from "pinia";

export const useAdminStore = defineStore("admin-store", {
  state: () => ({
    data: {},
  }),
  actions: {
    setData(data) {
      localStorage.setItem('admin-data', JSON.stringify(data));
      this.data = data;
    },
  },
});
