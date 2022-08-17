var path = require('path');

module.exports = {
    // entry: path.join(__dirname, 'srcjs', 'MotionTemplate.jsx'),
    entry: ["regenerator-runtime/runtime.js", path.join(__dirname, 'srcjs', 'MotionTemplate.jsx')],
    output: {
        path: path.join(__dirname, 'inst/htmlwidgets'),
        filename: 'MotionTemplate.js'
    },
    module: {
        rules: [
            {
                test: /\.js$|jsx/,
                loader: 'babel-loader',
                options: {
                    presets: ['@babel/preset-env', '@babel/preset-react']
                }
            },
            // For CSS so that import "path/style.css"; works
            {
                test: /\.css$/,
                use: ['style-loader', 'css-loader']
            }
        ]
    },
    externals: {
        'react': 'window.React',
        'react-dom': 'window.ReactDOM',
        'reactR': 'window.reactR'
    },
    stats: {
        colors: true
    },
    devtool: 'source-map'
};
