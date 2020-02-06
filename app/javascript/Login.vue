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
      <form @submit.prevent="regist">
        <label for="login-id">id</label>
        <input type="text" id="login-id" v-model="loginForm.account_id">
        <label for="login-id">Name</label>
        <input type="text" id="login-id" v-model="loginForm.name">
        <label for="login-password">Password</label>
        <input type="password" id="login-password" v-model="loginForm.password">
        <label for="login-password_confirmation">Password(確認)</label>
        <input type="password" id="login-password_confirmation" v-model="loginForm.password_confirmation">
        <div>
          <button type="submit">regist</button>
        </div>
      </form>
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
      registerForm: {
        account_id: '',
        name: '',
        password: '',
        password_confirmation: ''
      },
    }
  },
  methods: {
    async login () {
      await this.$store.dispatch('auth/login', this.loginForm)
      this.$router.push('/')
    },
    async regist () {
      await this.$store.dispatch('auth/regist', this.registerForm)
      this.$router.push('/')
    }
  }
}
</script>
