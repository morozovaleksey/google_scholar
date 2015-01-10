App.module "MainApp.Query", (Query, App, Backbone, Marionette, $, _) ->

  class Query.Controller extends App.Base.Controller

    initialize: (options) ->
      @getLayoutView()
      console.log "Query"

    getLayoutView: ->
      new Query.LayoutView
        el: $('#search-region')
