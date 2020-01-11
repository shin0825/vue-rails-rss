const state = {
  user: null
}
const getters = {}

const mutations = {
  setUser(state, user) {
    state.user = user
  }
}

const actions = {
  async login(context, data) {
    const response = await axios.post('/users/sign_in', data)
    context.commit('setUser', response.data)
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}
