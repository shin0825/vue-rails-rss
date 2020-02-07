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
    <div v-show="tab === 2">
      <form @submit.prevent="regist">
        <div v-if="registErrors" class="errors">
          <ul v-if="registErrors.account_id">
            <li v-for="msg in registErrors.account_id" :key="msg">{{ msg }}</li>
          </ul>
          <ul v-if="registErrors.password">
            <li v-for="msg in registErrors.password" :key="msg">{{ msg }}</li>
          </ul>
        </div>
        <label for="register-id">id</label>
        <input type="text" id="register-id" v-model="registerForm.account_id">
        <label for="register-name">Name</label>
        <input type="text" id="register-id" v-model="registerForm.name">
        <label for="register-password">Password</label>
        <input type="password" id="register-password" v-model="registerForm.password">
        <label for="register-password_confirmation">Password(確認)</label>
        <input type="password" id="register-password_confirmation" v-model="registerForm.password_confirmation">
        <div>
          <button type="submit">regist</button>
        </div>
      </form>
    </div>
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
  computed: {
    apiStatus () {
      return this.$store.state.auth.apiStatus
    },
    registErrors () {
      return this.$store.state.auth.registErrorMessages
    }
  },
  methods: {
    async login () {
      await this.$store.dispatch('auth/login', this.loginForm)
      this.$router.push('/')
    },
    async regist () {
      await this.$store.dispatch('auth/regist', this.registerForm)
      if (this.apiStatus) {
        this.$router.push('/')
      }
    },
    clearError () {
      this.$store.commit('auth/setRegistErrorMessages', null)
    }
  },
  created () {
    this.clearError()
  }
}
</script>
