<template>
  <div>
    <ul>
      <li @click="tab = 1">Login</li>
      <li @click="tab = 2">Register</li>
    </ul>
    <div v-show="tab === 1">
      <form @submit.prevent="login">
        <label for="login-id">id</label>
        <input type="text" id="login-id" v-model="loginForm.account_id">
        <label for="login-password">Password</label>
        <input type="password" id="login-password" v-model="loginForm.password">
        <div>
          <button type="submit">login</button>
        </div>
      </form>
    </div>
    <div v-show="tab === 2">Register Form</div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data () {
    return {
      tab: 1,
      loginForm: {
        account_id: '',
        password: ''
      },
    }
  },
  methods: {
    async login () {
      await this.$store.dispatch('auth/login', this.loginForm)
      this.$router.push('/')
    }
  }
}
</script>
