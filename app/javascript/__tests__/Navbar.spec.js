import { shallowMount, createLocalVue } from "@vue/test-utils";
import VueRouter from "vue-router";
import Vuex from "vuex";
import axios from "axios";

const localVue = createLocalVue();
localVue.use(VueRouter, Vuex, axios);

import App from '../components/Navbar.vue';

describe('Navbar.vue', () => {
  it('shallowMount', () => {
    const wrapper = shallowMount(App, { localVue });
  });
});
