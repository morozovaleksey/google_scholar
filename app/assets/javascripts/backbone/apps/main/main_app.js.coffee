App.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->

  class MainApp.AppRouter extends App.Base.AppRouter

    routes: (r = []) ->
      r[''] = 'main'
      r[Routes.search_efficiency_path().substr(1)] = 'searchEfficiency'
      r[Routes.parse_path().substr(1)] = 'googleResponse'
      r

    main: ->
      new MainApp.Query.Controller
    searchEfficiency: ->
      new MainApp.SearchEfficiency.Controller
    googleResponse: ->
      new MainApp.GoogleResponse.Controller



  App.addInitializer ->
    new MainApp.AppRouter