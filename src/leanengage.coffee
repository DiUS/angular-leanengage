'use strict'

###*
 # @ngdoc service
 # @name leanEngage.leanEngage
 # @description
 # # leanEngage
 # Provider in the profilesApp.
###
angular.module 'leanEngage', []

angular.module('leanEngage')
  .provider 'LeanEngage', ->

    # Private variables
    appId = null

    # Private constructor
    class LeanEngage

      constructor: (@$window) ->

      start: (userData)  ->
        userData.app_id = appId
        @$window.leanengage 'start', userData

      trackEvent: (namespace, event, data) ->
        @$window.leanengage 'trackEvent', "#{namespace}/#{event}", data

      triggerFeedback: (name) ->
        @$window.leanengage 'triggerFeedback', name

    # Public API for configuration
    @setAppId = (id) ->
      appId = id

    # Method for instantiating
    @$get = [
      '$window'
      ($window) ->
      `
      (function(window, doc, script, url, apiName, a, m) {window.LeanEngageObject = apiName;window[apiName] = window[apiName] || function() {(window[apiName].q = window[apiName].q || []).push(arguments);};window[apiName].l = 1 * new Date();a = doc.createElement(script);m = doc.getElementsByTagName(script)[0];a.async = 1;a.src = url;m.parentNode.insertBefore(a, m);
      })(window, document, 'script', '//www.leanengage.com/leanengage.v1.js', 'leanengage');
      `
      new LeanEngage($window)
    ]
    return
