import axios from 'axios'

const state = {
  datas: [],
  year: null,
  month: null
}
const getters = {
  check: state => !!state.datas,
  username: state => state.datas ? state.datas.length : 0
}

const mutations = {
    setDatas(state, links) {
      state.datas = links
    },
    setYearMonth(state, yearmonth) {
      state.year = yearmonth.year
      state.month = yearmonth.month
    }
}

const actions = {
  async selectAll(context) {
    const response = await axios.get('/api/v1/links')
    const links = response.data || []
    await context.commit('setYearMonth', {
      year: 2020,
      month: 3
    })
    await context.commit('setDatas', links)
  },
  async selectByMonth(context, yearmonth) {
    const response = await axios.get(`/api/v1/links/${yearmonth.year}/${yearmonth.month}`)
    const links = response.data || []
    await context.commit('setYearMonth', yearmonth)
    await context.commit('setDatas', links)
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}
