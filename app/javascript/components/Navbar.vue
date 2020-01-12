<template>
  <nav>
    <RouterLink to="/">
      HOME
    </RouterLink>
    <div>
      <span v-if="isLogin">
        {{ username }}
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
  }
}
</script>
