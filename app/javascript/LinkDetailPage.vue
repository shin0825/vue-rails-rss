<template>
  <div class="detail">
    <div class="table-container">
      <p class="title">
        <a v-bind:href="link.url" target=”_blank” rel=”noopener”>
          {{ link.title }}
        </a>
      </p>
      <table class="table is-striped">
        <thead>
          <tr>
            <th>Key</th>
            <th>Value</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>ID</td>
            <td>{{ link.id }}</td>
          </tr>
          <tr>
            <td>Title</td>
            <td>{{ link.title }}</td>
          </tr>
          <tr>
            <td>Url</td>
            <td>{{ link.url }}</td>
          </tr>
          <tr>
            <td>Created At</td>
            <td>{{ link.created_at }}</td>
          </tr>
          <tr v-if="link.user">
            <td>Created User</td>
            <td>{{ link.user.name }}</td>
          </tr>
          <tr v-if="link.user">
            <td>Created User ID</td>
            <td>{{ link.user.account_id }}</td>
          </tr>
        </tbody>
      </table>
      <button v-if="isLogin" v-on:click="destroyLink">Delete this</button>
      <router-link :to="{ path: '/' }">back</router-link>
    </div>
  </div>
</template>

<style>
.detail {
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>

<script>
import axios from "axios";
export default {
  data: function () {
    return {
      link: {}
    }
  },
  computed: {
    isLinkByLoginUser () {
      return this.$store.getters['auth/isLoginUser'](this.link.user_id)
    },
    isLogin () {
      return this.$store.getters['auth/check'] && this.isLinkByLoginUser
    }
  },
  mounted () {
    axios
      .get(`/api/v1/links/${this.$route.params.id}.json`)
      .then(response => (this.link = response.data))
  },
  methods: {
    destroyLink: function() {
      if (this.$store.state.auth.user != null) {
        const headers = {}
        headers['Content-Type'] = 'application/json'
        headers['Authorization'] = `Token ${this.$store.state.auth.user.api_token}`

        axios
          .delete(`/api/v1/links/${this.$route.params.id}`, this.link, {headers: headers})
          .then(response => {
            let e = response.data;
            this.$router.push({ path: '/' });
          })
          .catch(error => {
            console.error(error);
            if (error.response.data && error.response.data.errors) {
              this.errors = error.response.data.errors;
            }
          });
      }
    }
  }
}
</script>
