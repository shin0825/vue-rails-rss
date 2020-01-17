<template>
  <nav>
    <RouterLink to="/">
      HOME
    </RouterLink>
    <RouterLink v-if="isLogin" :to="{ name: 'LinkNewPage' }">
      + ADD
    </RouterLink>
    <div>
      <span v-if="isLogin">
        {{ username }}
        /
        <button @click="logout">Logout</button>
      </span>
      <div v-else>
        <RouterLink to="/login">
          LOGIN
        </RouterLink>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  computed: {
    isLogin () {
      return this.$store.getters['auth/check']
    },
    username () {
      return this.$store.getters['auth/username']
    }
  },
  methods: {
    async logout () {
      await this.$store.dispatch('auth/logout')
      this.$router.push('/login')
    }
  }
}
</script>
