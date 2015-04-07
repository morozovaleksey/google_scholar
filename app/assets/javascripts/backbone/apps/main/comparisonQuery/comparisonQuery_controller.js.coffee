App.module "MainApp.ComparisonQuery", (ComparisonQuery, App, Backbone, Marionette, $, _) ->

  class ComparisonQuery.Controller extends App.Base.Controller

    initialize: (options) ->
      @layoutView = @getLayoutView()


    getLayoutView: ->
      new ComparisonQuery.LayoutView
        el: $('#comparison-queries-region')

