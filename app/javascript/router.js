import Vue from 'vue'
import VueRouter from 'vue-router'
import LinkIndexPage from 'LinkIndexPage.vue'
import LinkPerMonthPage from 'LinkPerMonthPage.vue'
import LinkDetailPage from 'LinkDetailPage.vue'
import LinkNewPage from 'LinkNewPage.vue'
import Login from 'Login.vue'
import store from './store'

// ref. https://jp.vuejs.org/v2/guide/plugins.html#%E3%83%97%E3%83%A9%E3%82%B0%E3%82%A4%E3%83%B3%E3%81%AE%E4%BD%BF%E7%94%A8
Vue.use(VueRouter)

const router = new VueRouter({
  routes: [{
      path: '/',
      component: LinkIndexPage
    },
    {
      path: '/links/:year(\\d+)/:month(\\d+)',
      name: 'LinkPerMonthPage',
      component: LinkPerMonthPage
    },
    {
      path: '/links/:id(\\d+)',
      name: 'LinkDetailPage',
      component: LinkDetailPage
    },
    {
      path: '/links/new',
      name: 'LinkNewPage',
      component: LinkNewPage,
      beforeEnter(to, from, next) {
        if (store.getters['auth/check']) {
          next()
        } else {
          next('/login')
        }
      }
    },
    {
      path: '/login',
      component: Login,
      beforeEnter(to, from, next) {
        if (store.getters['auth/check']) {
          next('/')
        } else {
          next()
        }
      }
    }
  ]
})

export default router
