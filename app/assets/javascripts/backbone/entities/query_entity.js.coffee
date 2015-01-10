App.module "Entities.Querys", (Query, App, Backbone, Marionette, $, _) ->

  class Query.Model extends App.Base.Model

  API =
    getQueryModel: (options) ->
      new Query.Model(options)

  App.reqres.setHandler "query:model", (options) ->
    API.getQueryModel(options)
