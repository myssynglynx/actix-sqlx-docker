module.exports = {
  presets: [
    ['@babel/preset-env', {targets: {node: 'current'}}],
    ['@babel/react', {"runtime": "automatic"}],
    '@babel/preset-typescript',
  ],
  plugins: [
    // This helps support import.meta
    function () {
      return {
        visitor: {
          MetaProperty(path) {
            path.replaceWithSourceString('process')
          },
        },
      }
    },
  ],
};


