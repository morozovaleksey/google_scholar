App.module "MainApp.GoogleResponse", (GoogleResponse, App, Backbone, Marionette, $, _) ->

  class GoogleResponse.Controller extends App.Base.Controller

    initialize: (options) ->
      @layoutView = @getLayoutView()
      @getQueryResponse(@layoutView)

    getLayoutView: ->
      new GoogleResponse.LayoutView
        el: $('#responce-region')

    getQueryResponse:(layoutView) ->
      console.log @googleResponseModel = App.request "google:response:model"
      layoutView.googleResponseModel = @googleResponseModel