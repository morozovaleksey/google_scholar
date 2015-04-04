App.module "MainApp.ComparisonQuery", (ComparisonQuery, App, Backbone, Marionette, $, _) ->

  class ComparisonQuery.Controller extends App.Base.Controller

    initialize: (options) ->
      @layoutView = @getLayoutView()
#      @getComparisonQuery(@layoutView)

    getLayoutView: ->
      new ComparisonQuery.LayoutView
        el: $('#comparison-queries-region')

#    getComparisonQuery:(layoutView) ->
#      console.log @googleResponseModel = App.request "google:response:model"
#      layoutView.googleResponseModel = @googleResponseModel