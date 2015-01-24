App.module "MainApp.SearchEfficiency", (SearchEfficiency, App, Backbone, Marionette, $, _) ->

  class SearchEfficiency.Controller extends App.Base.Controller

    initialize: (options) ->
      @layoutView = @getLayoutView()

    getLayoutView: ->
      new SearchEfficiency.LayoutView
        el: $('#search-efficient-query-region')


