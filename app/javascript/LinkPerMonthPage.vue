<template>
  <div>
    <div class="container">
      <section class="section">
        <div class="columns is-variable is-full">
          <div class="select yearmonth">
            <select v-on:change="readYearMonths">
                <option disabled value="">選択して下さい</option>
                <option v-for="yearmonth in yearmonths" v-bind:value="yearmonth.name" v-bind:key="yearmonth.name">
                    {{ yearmonth.name }}
                </option>
            </select>
          </div>
        </div>
        <div class="columns is-variable is-multiline is-6">
          <div class="cards column is-6 is-half" v-for="link in links" :key="link.id">
            <div class="content is-medium">
              <LinkCard v-bind:link="link"/>
            </div>
          </div>
        </div>
      </section>
    </div>
  </div>
</template>

<style scoped>
div.yearmonth {
  margin: 0 auto;
  width: 100%;
}

div.yearmonth select {
  width: 100%;
}

div.cards {
  margin: 0 auto;
}

div.content {
  height: 100%;
}
</style>

<script>
import moment from 'moment'
import LinkCard from './components/LinkCard.vue'

export default {
  components: {
    LinkCard
  },
  computed: {
    links () {
      return this.$store.state.links.datas
    },
    yearmonths () {
      return this.$store.state.links.yearmonths
    }
  },
  methods: {
    async readDatas () {
      await this.$store.dispatch('links/selectByMonth', { year: this.$route.params.year, month: this.$route.params.month} )
    },
    async readYearMonths (e) {
      this.$router.push({ name: 'LinkPerMonthPage', params: { year: String(e.target.value).substring(0, 4), month: String(e.target.value).substring(4, 6) } })
    },
  },
  watch: {
    '$route': 'readDatas'
  },
  mounted () {
    this.readDatas();
  },
}
</script>
