import { defineStore } from "pinia";

export const useUserStore = defineStore("userdata", {
  state: () => ({
    isAuthenticated: false,
    data: {},
  }),

  getters: {
    getUsetData() {
      return state.data;
    },
  },

  actions: {
    setUserData(data) {
      this.data = data;
      this.isAuthenticated = true;
    },
    logout() {
      (this.data = {}), (this.isAuthenticated = false);
    },
  },
});
