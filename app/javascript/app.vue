<template>
  <div>
    <header id="nav-top" class="nav mb-5">
      <Navbar/>
    </header>
    <main id="nav-main">
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
    position: fixed;
    left: 0px;
    top: 0px;
    z-index: 9999;
    text-align: center;
    padding: 1rem;
    background-color: #2366d136;
  }
  #nav-main {
    margin-top: 50px;
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
    background-color: #2366d136;
  }
  #nav-main {
    margin-bottom: 50px;
  }
}
</style>
