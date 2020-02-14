<template>
  <div class="save">
    <form @submit.prevent="createLink">
      <ul>
        <li><label>SET THE ARTICLE URL</label></li>
        <li>
            <div v-if="errors.length != 0">
              <ul v-for="e in errors" :key="e">
                <li><font color="red">{{ e }}</font></li>
              </ul>
            </div>
            <div>
              <input v-model="link.url" type="text" class="url original-input">
            </div>
        </li>
        <li>
          <button type="submit" class="submit original-input">SAVE ARTICLE LINK</button>
        </li>
        <li>
          <router-link :to="{ path: '/' }">BACK</router-link>
        </li>
      </ul>
    </form>
  </div>
</template>

<style scoped>
.save {
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
}
.save ul li {
  text-align: center;
  margin-top: 10px;
}
.url {
  font-size: 2em;
}
.submit {
  font-size: 1.25em;
  padding: 10px;
}
</style>

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
      if (this.$store.state.auth.user != null) {
        const headers = {}
        headers['Content-Type'] = 'application/json'
        headers['Authorization'] = `Token ${this.$store.state.auth.user.api_token}`

        axios
          .post('/api/v1/links', this.link, {headers: headers})
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

<style scoped>
p {
  font-size: 1.2em;
  text-align: center;
}
</style>
