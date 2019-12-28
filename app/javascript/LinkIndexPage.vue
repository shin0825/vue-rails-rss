<template>
  <div id="app">
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>title</th>
          <th>url</th>
        </tr>
        <tr v-for="link in links" :key="link.id">
          <td>{{ link.id }}</td>
          <td>{{ link.title }}</td>
          <td>{{ link.url }}</td>
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
