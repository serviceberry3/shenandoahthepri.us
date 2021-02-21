const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',

    //this path indicates jquery installed in node_modules directory having sub directory ‘jquery/src’ and which contains jquery.js file there
    jQuery: 'jquery/src/jquery'
  })
)

module.exports = environment
