<template>
  <div>
    <div v-show="tab === 1">
      <div class="tabpage">
        <form @submit.prevent="login">
          <ul>
            <li><label for="login-id">id</label></li>
            <li><input type="text" id="login-id" class="input original-input" v-model="loginForm.account_id"></li>
            <li><label for="login-password">Password</label></li>
            <li><input type="password" id="login-password" class="input original-input" v-model="loginForm.password"></li>
            <li><button type="submit" class="submit original-input">login</button></li>
          </ul>
        </form>
      </div>
    </div>
    <div v-show="tab === 2">
      <div class="tabpage">
        <form @submit.prevent="regist">
          <ul>
            <li>
              <div v-if="registErrors" class="errors">
                <ul v-if="registErrors.account_id">
                  <li v-for="msg in registErrors.account_id" :key="msg">{{ msg }}</li>
                </ul>
                <ul v-if="registErrors.password">
                  <li v-for="msg in registErrors.password" :key="msg">{{ msg }}</li>
                </ul>
              </div>
            </li>
            <li><label for="register-id">id</label></li>
            <li><input type="text" id="register-id" class="input original-input" v-model="registerForm.account_id"></li>
            <li><label for="register-name">Name</label></li>
            <li><input type="text" id="register-id" class="input original-input" v-model="registerForm.name"></li>
            <li><label for="register-password">Password</label></li>
            <li><input type="password" id="register-password" class="input original-input" v-model="registerForm.password"></li>
            <li><label for="register-password_confirmation">Password(確認)</label></li>
            <li><input type="password" id="register-password_confirmation" class="input original-input" v-model="registerForm.password_confirmation"></li>
            <li><button type="submit" class="input original-input">regist</button></li>
          </ul>
        </form>
      </div>
    </div>
    <div class="tab">
      <ul>
        <li v-show="tab === 2" @click="tab = 1">Sign In?</li>
        <li v-show="tab === 1" @click="tab = 2">Sign Up?</li>
      </ul>
    </div>
  </div>
</template>

<style scoped>
.tab {
  height: 20%;
  margin: 35px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.tabpage {
  height: 80%;
  display: flex;
  align-items: center;
  justify-content: center;
}
.tabpage ul li {
  text-align: center;
  margin-top: 10px;
}
.input {
  font-size: 2em;
  width: 90%;
}
.submit {
  font-size: 1.25em;
  padding: 10px;
}
</style>

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
