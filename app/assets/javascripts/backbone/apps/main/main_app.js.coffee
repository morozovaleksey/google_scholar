App.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->

  class MainApp.AppRouter extends App.Base.AppRouter

    routes: (r = []) ->
      r[''] = 'main'
      r[Routes.search_efficiency_path().substr(1)] = 'searchEfficiency'
      r

    main: ->
      console.log "Main"
      new MainApp.Query.Controller
    searchEfficiency: ->
      new MainApp.SearchEfficiency.Controller



  App.addInitializer ->
    new MainApp.AppRouter