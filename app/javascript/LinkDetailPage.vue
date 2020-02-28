<template>
  <div>
    <button v-on:click="destroyLink">Delete this</button>
    <dl>
      <dt>ID</dt>
      <dd>{{ link.id }}</dd>
      <dt>Title</dt>
      <dd>{{ link.title }}</dd>
      <dt>Url</dt>
      <dd>{{ link.url }}</dd>
    </dl>
    <router-link :to="{ path: '/' }">back</router-link>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data: function () {
    return {
      link: {}
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
