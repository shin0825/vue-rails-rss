import Vue from 'vue'
import App from '../app.vue'
import store from '../store'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('app'))
  const app = new Vue({
    el,
    store,
    render: h => h(App)
  })
})
