App.module "Entities.Relevance", (Relevance, App, Backbone, Marionette, $, _) ->

  class Relevance.Model extends App.Base.Model
    url: ->
      Routes.get_relevance_path { format: 'json'}

  API =
    getRelevanceModel: (options) ->
      new Relevance.Model(options)

  App.reqres.setHandler "relevance:model", (options) ->
    API.getRelevanceModel(options)
