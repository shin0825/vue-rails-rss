<template>
  <div>
    <div class="container">
      <section class="section">
        <div class="columns is-variable is-multiline is-6">
          <router-link :to="{ name: 'LinkPerMonthPage', params: { year: this.$store.state.links.year, month: this.$store.state.links.month - 1 } }">
            BACK
          </router-link>
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
div.cards {
  margin: 0 auto;
}

div.content {
  height: 100%;
}
</style>

<script>
import moment from 'moment'
import axios from 'axios'
axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
};
import LinkCard from './components/LinkCard.vue'

export default {
  components: {
    LinkCard
  },
  computed: {
    links () {
      return this.$store.state.links.datas
    }
  },
  methods: {
    async readDatas () {
      await this.$store.dispatch('links/selectByMonth', { year: this.$route.params.year, month: this.$route.params.month} )
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
