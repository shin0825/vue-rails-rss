<template>
  <div>
    <div class="container">
      <section class="section">
        <div class="columns is-variable is-12" v-for="link in links" :key="link.id">
          <div class="column is-10 is-half">
            <div class="content is-medium">
              <div class="flexbox subtitle is-5 has-text-grey">
                <div>
                  <router-link :to="{ name: 'LinkDetailPage', params: { id: link.id } }">
                    {{ link.created_at | moment }}
                  </router-link>
                </div>
                <div class="left-margin" v-if="link.tweet_url">
                  <a class="tweet" v-bind:href="link.tweet_url" target="_blank" rel=”noopener”>
                    Tweet
                  </a>
                </div>
              </div>
              <div class="title has-text-black is-3">
                <a v-bind:href="link.url" target=”_blank” rel=”noopener”>
                  {{ link.title }}
                </a>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  </div>
</template>

<script>
import moment from 'moment'
import axios from 'axios'
axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
};

export default {
  computed: {
    links () {
      return this.$store.state.links.datas
    }
  },
  methods: {
    async readDatas () {
      await this.$store.dispatch('links/selectAll')
    },
  },
  mounted () {
    this.readDatas();
  },
  filters: {
    moment: function (date) {
      return moment(date).format('YYYY/MM/DD HH:mm');
    }
  }
}
</script>

<style scoped>

div.flexbox {
  display: flex;
}

div.left-margin {
  margin-left: 10px;
}

.tweet {
  background-color: #3273dc;
  color: #ffffff;
  border-radius: 2px;
  padding:2px 10px;
  transition: all .3s;
}

.tweet:hover {
  background-color: #ffffff;
  color: #3273dc;
}

p {
  font-size: 2em;
  text-align: center;
}
</style>
