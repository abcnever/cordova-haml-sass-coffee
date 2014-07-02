require.config
  baseUrl: 'js/vendor'
  paths:
    jquery: 'jquery-1.11.1.min'
    backbone: 'backbone-1.1.2.min'
    bootstrap: 'bootstrap.min'

  shim:
    'backbone':
      deps: ['underscore', 'jquery']
      exports: 'Backbone'
    'underscore':
      exports: '_'

require ['jquery', 'backbone', 'app/router'], ($, Backbone, Router) ->
  router = new Router()

  $("body").on "click", ".back-button", (event) ->
    event.preventDefault()
    window.history.back()

  Backbone.history.start()
