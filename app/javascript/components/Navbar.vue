<template>
  <nav class="flex-box">
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
    <div>
      <ul class="flex-box">
        <li><RouterLink to="/">
          HOME
        </RouterLink></li>
        <li><RouterLink v-if="isLogin" :to="{ name: 'LinkNewPage' }">
          ADD
        </RouterLink></li>
      </ul>
    </div>
  </nav>
</template>

<style>
.flex-box {
  display: flex;
  justify-content: space-between;
}
.flex-box li{
  margin-left:30px;
  list-style:none;
}
</style>

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
