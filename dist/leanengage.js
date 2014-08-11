(function() {
  'use strict';
  /**
   # @ngdoc service
   # @name leanEngage.leanEngage
   # @description
   # # leanEngage
   # Provider in the profilesApp.
  */

  angular.module('leanEngage', []);

  angular.module('leanEngage').provider('LeanEngage', function() {
    var LeanEngage, appId;
    appId = null;
    LeanEngage = (function() {
      function LeanEngage($window) {
        this.$window = $window;
      }

      LeanEngage.prototype.start = function(userData) {
        userData.app_id = appId;
        return this.$window.leanengage('start', userData);
      };

      LeanEngage.prototype.trackEvent = function(namespace, event, data) {
        return this.$window.leanengage('trackEvent', "" + namespace + "/" + event, data);
      };

      return LeanEngage;

    })();
    this.setAppId = function(id) {
      return appId = id;
    };
    this.$get = function($window) {
      
      (function(window, doc, script, url, apiName, a, m) {window.LeanEngageObject = apiName;window[apiName] = window[apiName] || function() {(window[apiName].q = window[apiName].q || []).push(arguments);};window[apiName].l = 1 * new Date();a = doc.createElement(script);m = doc.getElementsByTagName(script)[0];a.async = 1;a.src = url;m.parentNode.insertBefore(a, m);
      })(window, document, 'script', '//www.leanengage.com/leanengage.v1.js', 'leanengage');
      ;
      return new LeanEngage($window);
    };
  });

}).call(this);
