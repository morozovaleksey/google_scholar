App.module "Entities.ScienceArea", (ScienceArea, App, Backbone, Marionette, $, _) ->

  class ScienceArea.Model extends App.Base.Model
    url: ->
      Routes.related_subjects_path { format: 'json'}

  API =
    getScienceAreaModel: (options) ->
      new ScienceArea.Model(options)

  App.reqres.setHandler "scienceArea:model", (options) ->
    API.getScienceAreaModel(options)
