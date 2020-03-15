<template>
  <div>
    <div class="container">
      <section class="section">
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
div.cards {
  margin: 0 auto;
}

div.content {
  height: 100%;
}
</style>

<script>
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
      await this.$store.dispatch('links/selectByAccountId', this.$route.params.account_id )
    },
  },
  watch: {
    '$route': 'readDatas'
  },
  mounted () {
    this.readDatas();
  }
}
</script>
