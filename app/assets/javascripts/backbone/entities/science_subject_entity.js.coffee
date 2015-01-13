App.module "Entities.ScienceSubject", (ScienceSubject, App, Backbone, Marionette, $, _) ->

  class ScienceSubject.Model extends App.Base.Model
    url: ->
      Routes.related_terms_path { format: 'json'}

  API =
    getScienceSubjectModel: (options) ->
      new ScienceSubject.Model(options)

  App.reqres.setHandler "scienceSubject:model", (options) ->
    API.getScienceSubjectModel(options)
