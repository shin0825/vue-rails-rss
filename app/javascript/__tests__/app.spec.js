import {
  shallowMount
} from '@vue/test-utils';

import App from '../app.vue';

const assert = require('assert');

describe('Assert', () => {
  describe('Vue', () => {
    it('shallowMount', () => {
      const wrapper = shallowMount(App);
      assert.equal(wrapper.text(), 'Hello Vue!');
    });
  });
});
