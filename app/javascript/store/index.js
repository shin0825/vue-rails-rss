import Vue from 'vue'
import Vuex from 'vuex'

import auth from './auth'
import error from './error'
import links from './links'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    auth,
    error,
    links
  }
})

export default store
