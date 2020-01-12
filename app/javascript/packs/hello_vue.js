import '../bootstrap'
import Vue from 'vue'
import router from '../router'
import store from '../store'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('hello'))
  const app = new Vue({
    el,
    router,
    store,
    render: h => h(App)
  })

  console.log(app)
})
