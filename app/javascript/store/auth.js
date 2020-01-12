import axios from 'axios'

const state = {
  user: null
}
const getters = {
  check: state => !!state.user,
  username: state => state.user ? state.user.name : ''
}

const mutations = {
  setUser(state, user) {
    state.user = user
  }
}

const actions = {
  async login(context, data) {
    const response = await axios.post('/users/sign_in', data)
    context.commit('setUser', response.data)
  },
  async currentUser(context) {
    if (state.user != null) {
      const headers = {}
      headers['Content-Type'] = 'application/json'
      headers['Authorization'] = `Token ${state.user.api_token}`
      const response = await axios.get('/users/me', headers)
      const user = response.data || null
      context.commit('setUser', user)
    }
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}
