App.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->

  class MainApp.AppRouter extends App.Base.AppRouter

    routes: (r = []) ->
      r[''] = 'main'
      r

    main: ->
      console.log "Main"
      new MainApp.Query.Controller


  App.addInitializer ->
    new MainApp.AppRouter