import axios from "axios";
import { OK, CONFLICT } from '../util'

const state = {
  user: null,
  apiStatus: null,
  registErrorMessages: null
}
const getters = {
  check: state => !!state.user,
  username: state => state.user ? state.user.name : ''
}

const mutations = {
  setUser(state, user) {
    state.user = user
  },
  setApiStatus(state, status) {
    state.apiStatus = status
  },
  setRegistErrorMessages(state, messages) {
    state.registErrorMessages = messages
  }
}

const actions = {
  async regist(context, data) {
    context.commit('setApiStatus', null)
    const requestOptions = {
      withCredentials: true
    };
    const response = await axios.post('/api/v1/sign_up', data, requestOptions)
      .catch(err => err.response || err)

    if (response.status === OK) {
      context.commit('setApiStatus', true)
      context.commit('setUser', response.data)
      return false
    }

    context.commit('setApiStatus', false)
    if (response.status === CONFLICT) {
      context.commit('setRegistErrorMessages', response.data.errors)
    } else {
      context.commit('error/setCode', response.status, {
        root: true
      })
    }
  },
  async login(context, data) {
    const requestOptions = {
      withCredentials: true
    };
    const response = await axios.post('/api/v1/sign_in', data, requestOptions)
    context.commit('setUser', response.data)
  },
  async logout(context) {
    const response = await axios.delete('/api/v1/sign_out')
    context.commit('setUser', null)
  },
  async currentUser(context) {
    const response = await axios.get('/api/v1/me')
    const user = response.data || null
    context.commit('setUser', user)
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}
