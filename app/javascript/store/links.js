import axios from "axios";

const state = {
  datas: [],
  year: null,
  month: null,
  yearmonths: []
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
    },
    setYearMonths(state, yearmonths) {
      state.yearmonths = yearmonths
    }
}

const actions = {
  async selectAll(context) {
    const links_lists = await axios.get('/api/v1/links_lists')
    const yearmonths = links_lists.data || []
    await context.commit('setYearMonths', yearmonths)

    const response = await axios.get('/api/v1/links')
    const links = response.data || []
    await context.commit('setYearMonth', {
      year: yearmonths[0].year,
      month: yearmonths[0].month
    })
    await context.commit('setDatas', links)
  },
  async selectByMonth(context, yearmonth) {
    const response = await axios.get(`/api/v1/links/${yearmonth.year}/${yearmonth.month}`)
    const links = response.data || []
    await context.commit('setYearMonth', yearmonth)
    await context.commit('setDatas', links)

    const links_lists = await axios.get('/api/v1/links_lists')
    const yearmonths = links_lists.data || []
    await context.commit('setYearMonths', yearmonths)
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}
