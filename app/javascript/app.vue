<template>
  <div>
    <header id="nav-top" class="nav mb-5">
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

<style>
@media screen and (min-width: 812px) {
  #nav-top {
    display: block;
    width: 100%;
    text-align: center;
    padding: 0 auto;
  }
}

@media screen and (max-width: 812px) {
  #nav-top {
    display: block;
    width: 100%;
    position: fixed;
    left: 0px;
    bottom: 0px;
    z-index: 9999;
    text-align: center;
    padding: 1rem;
    background-color: #62d9a3ee;
  }
}
</style>
