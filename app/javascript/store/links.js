import axios from 'axios'

const state = {
  datas: [],
}
const getters = {
  check: state => !!state.datas,
  username: state => state.datas ? state.datas.length : 0
}

const mutations = {
  setDatas(state, links) {
    state.datas = links
  }
}

const actions = {
  async selectAll(context) {
    const response = await axios.get('/api/v1/links')
    const links = response.data || []
    context.commit('setDatas', links)
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}
