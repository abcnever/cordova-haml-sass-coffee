require.config({
  baseUrl: 'js/vendor',
  paths: {
    jquery: 'jquery-2.1.3.min',
    backbone: 'backbone-1.1.2.min',
    bootstrap: 'bootstrap.min'
  },
  shim: {
    'backbone': {
      deps: ['underscore', 'jquery'],
      exports: 'Backbone'
    },
    'underscore': {
      exports: '_'
    }
  }
});

require(['jquery', 'backbone', 'app/router'], function($, Backbone, Router) {
  var router;
  router = new Router();
  $("body").on("click", ".back-button", function(event) {
    event.preventDefault();
    return window.history.back();
  });
  return Backbone.history.start();
});
