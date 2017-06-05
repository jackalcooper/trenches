import node_resolve from 'rollup-plugin-node-resolve';
import commonjs from 'rollup-plugin-commonjs';

export default {
    entry: './lib/es6/bs/lobby.js',
    format: 'cjs',
    dest: './js/lobby-bundled.js',
    plugins: [
        node_resolve({module: true, browser: true}),
        commonjs({
            include: 'node_modules/phoenix/**',
            namedExports: {
                'node_modules/phoenix/priv/static/phoenix.js': ['Socket']
            }
        })
    ],
    moduleName: 'trenches'
}