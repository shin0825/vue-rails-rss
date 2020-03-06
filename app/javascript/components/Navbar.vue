<template>
  <nav class="flex-box">
    <div>
      <span v-if="isLogin">
        {{ username }}
        /
        <button class="original-input" @click="logout">LOGOUT</button>
      </span>
    </div>
    <div>
      <ul class="flex-box">
        <li><RouterLink to="/">
          HOME
        </RouterLink></li>
        <li>
          <router-link :to="{ name: 'LinkPerMonthPage', params: { year: this.$store.state.links.year, month: this.$store.state.links.month} }">
            ARCHIVE
          </router-link></li>
        <li v-if="isLogin"><RouterLink :to="{ name: 'LinkNewPage' }">
          ADD
        </RouterLink></li>
        <li v-else><RouterLink to="/login">
          LOGIN
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
