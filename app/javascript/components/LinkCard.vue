<template>
  <div class="card">
    <div class="card-content">
      <p class="title">
        <a v-bind:href="link.url" target=”_blank” rel=”noopener”>
          {{ link.title }}
        </a>
      </p>
      <p class="subtitle">
          add by {{ link.user.name }}
      </p>
    </div>
    <footer class="card-footer">
      <p class="is-marginless card-footer-item">
        <router-link :to="{ name: 'LinkDetailPage', params: { id: link.id } }">
          {{ link.created_at | moment }}
        </router-link>
      </p>
      <p class="card-footer-item">
        <a class="tweet" v-bind:href="link.tweet_url" target="_blank" rel=”noopener”>
          Tweet
        </a>
      </p>
    </footer>
  </div>
</template>

<style scoped>
.card {
  height: 100%;
  display: flex;
  flex-direction: column;
}

.card-content {
    height: 100%;
}

.moment {
  margin: 1px;
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
  font-size: 1.2em;
  text-align: center;
}
</style>


<script>
import moment from 'moment'
export default {
  props: {
    link: {
      type: Object
    }
  },
  filters: {
    moment: function (date) {
      return moment(date).format('YYYY/MM/DD HH:mm');
    }
  }
}
</script>
