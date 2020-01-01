<template>
  <div id="app">
    <router-link :to="{ name: 'LinkNewPage' }">+ ADD</router-link>
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>title</th>
          <th>created at</th>
        </tr>
        <tr v-for="link in links" :key="link.id">
          <td><router-link :to="{ name: 'LinkDetailPage', params: { id: link.id } }">{{ link.id }}</router-link></td>
          <td><a v-bind:href="link.url">{{ link.title }}</a></td>
          <td>{{ link.created_at }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from 'axios'
axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
};

export default {
  data: function () {
    return {
      links: []
    }
  },
  mounted () {
    axios
      .get('/api/v1/links.json')
      .then(response => (this.links = response.data))
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
