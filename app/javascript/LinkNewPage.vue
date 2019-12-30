<template>
  <div>
    <form @submit.prevent="createLink">
      <div v-if="errors.length != 0">
        <ul v-for="e in errors" :key="e">
          <li><font color="red">{{ e }}</font></li>
        </ul>
      </div>
      <div>
        <label>URL</label>
        <input v-model="link.url" type="text">
      </div>
      <button type="submit">Commit</button>
    </form>
    <router-link :to="{ path: '/' }">back</router-link>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      link: {
        url: '',
        title: ''
      },
      errors: ''
    }
  },
  methods: {
    createLink: function() {
      axios
        .post('/api/v1/links', this.link)
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
</script>

<style scoped>
</style>
