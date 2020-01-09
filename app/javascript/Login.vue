<template>
  <div>
    <ul>
      <li
        @click="tab = 1"
      >Login</li>
      <li
        @click="tab = 2"
      >Register</li>
    </ul>
    <div v-sow="tab === 1">
      <div v-show="tab === 1">
        <form>
          <label for="login-id">id</label>
          <input type="text" id="login-id" v-model="loginForm.id">
          <label for="login-password">Password</label>
          <input type="password" id="login-password" v-model="loginForm.password">
          <div>
            <button type="submit" @submit.prevent="login">login</button>
          </div>
        </form>
      </div>
    </div>
    <div v-show="tab === 2">Register Form</div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      tab: 1,
      loginForm: {
        id: '',
        password: ''
      },
    }
  },
  methods: {
    login () {
      console.log(this.loginForm)
    }
  }
}
</script>
