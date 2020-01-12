import Vue from 'vue'
import router from '../router'
import store from '../store'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('hello'))

  const createApp = async () => {
    await store.dispatch('auth/currentUser')

    new Vue({
      el,
      router,
      store,
      render: h => h(App)
    })
  }

  createApp()
})
