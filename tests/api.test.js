const assert = require('assert');
const { resolveApiBase } = require('../frontend/js/api.js');

assert.strictEqual(
  resolveApiBase('http://localhost/project/frontend/js/auth.js'),
  '/project/backend/api'
);

assert.strictEqual(
  resolveApiBase('http://localhost/frontend/js/auth.js'),
  '/backend/api'
);

console.log('API base resolution tests passed');
