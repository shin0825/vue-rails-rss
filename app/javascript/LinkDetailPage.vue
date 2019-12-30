<template>
  <div>
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
  }
}
</script>
