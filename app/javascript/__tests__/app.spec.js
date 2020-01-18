import { shallowMount, createLocalVue } from "@vue/test-utils";
import VueRouter from "vue-router";

const localVue = createLocalVue();
localVue.use(VueRouter);

import App from '../app.vue';

const assert = require('assert');

describe('Assert', () => {
  describe('Vue', () => {
    it('shallowMount', () => {
      const wrapper = shallowMount(App, { localVue });
      assert.equal(wrapper.text(), 'Hello Vue!');
    });
  });
});
