<template>
  <div>
    <header>
      <Navbar/>
    </header>
    <main>
      <div class="container">
        <RouterView />
      </div>
    </main>
  </div>
</template>

<script>
import 'bulma/css/bulma.css'
import Vue from 'vue'
import VueRouter from 'vue-router'
import Navbar from './components/Navbar.vue'

export default {
  components: {
    Navbar
  }
}
</script>

<style scoped>
</style>
