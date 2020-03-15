<template>
  <div class="card">
    <div class="card-content">
      <div class="card-item">
        <router-link class="usernameplate link" :to="{ name: 'UserPage', params: { account_id: link.user.account_id } }">
          <p>
            {{ link.user.name }}
          </p>
        </router-link>
        <div>
          <p class="title">
            <a v-bind:href="link.url" target=”_blank” rel=”noopener”>
              {{ link.title }}
            </a>
          </p>
        </div>
      </div>
    </div>
    <footer class="card-footer">
      <p class="is-marginless card-footer-item">
        <router-link :to="{ name: 'LinkDetailPage', params: { id: link.id } }">
          {{ link.created_at | moment }}
        </router-link>
      </p>
      <p class="card-footer-item">
        <a class="tweet link" v-bind:href="link.tweet_url" target="_blank" rel=”noopener”>
          Tweet
        </a>
      </p>
    </footer>
  </div>
</template>

<style scoped>
.card-item{
  display: flex;
  width: 100%;
}

.usernameplate {
  display: flex;
  overflow: hidden;
  justify-content: center;
  align-items: center;
  border-radius: 0.5em;
  width: 4.5em;
  height: 4.5em;
  flex-shrink: 0;
  margin-right: .5em;
  margin-bottom: .5em;
}

.usernameplate p {
  font-weight: bold;
  margin: 0 auto;
  width: 3em;
  white-space: normal;
}

.card {
  height: 100%;
  display: flex;
  flex-direction: column;
  font-size: smaller;
}

.card-content {
    height: 100%;
}

.moment {
  margin: 1px;
}

.tweet {
  border-radius: 0.25em;
  padding:2px 10px;
}

.link {
  background-color: #3273dc;
  color: #ffffff;
  transition: all .3s;
}

.link:hover {
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
