import Vue from 'vue'
import router from '../router'
import store from '../store'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const createApp = async () => {
    await store.dispatch('auth/currentUser')

    const app = new Vue({
      router,
      store,
      render: h => h(App)
    }).$mount()
    document.body.appendChild(app.$el)
  }

  createApp()
})
