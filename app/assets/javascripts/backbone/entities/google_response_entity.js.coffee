App.module "Entities.GoogleResponse", (GoogleResponse, App, Backbone, Marionette, $, _) ->

  class GoogleResponse.Model extends App.Base.Model
    url: ->
      Routes.add_to_query_path { format: 'json'}

  API =
    getGoogleResponseModel: (options) ->
      new GoogleResponse.Model(options)

  App.reqres.setHandler "google:response:model", (options) ->
    API.getGoogleResponseModel(options)
