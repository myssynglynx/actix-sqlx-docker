module.exports = {
  parser: '@typescript-eslint/parser',
  plugins: ['@typescript-eslint/eslint-plugin', 'prettier'],
  rules: {
    "prettier/prettier": "error"
  },
  root: true,
  ignorePatterns: ["dist/", ".yarn/", "*.js", "*.cjs"],
  extends: ['eslint:recommended', 'plugin:@typescript-eslint/recommended', 'plugin:prettier/recommended']
};

