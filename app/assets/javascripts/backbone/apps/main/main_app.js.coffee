App.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->

  class MainApp.AppRouter extends App.Base.AppRouter
    initialize: ->

    routes: (r = []) ->
      r[''] = 'main'
      r[Routes.search_efficiency_path().substr(1)] = 'searchEfficiency'
      r[Routes.parse_path().substr(1)] = 'googleResponse'
      r[Routes.comparison_queries_path().substr(1)] = 'comparisonQueries'
      r

    main: ->
      new MainApp.Query.Controller
    searchEfficiency: ->
      new MainApp.SearchEfficiency.Controller
    googleResponse: ->
      new MainApp.GoogleResponse.Controller
    comparisonQueries: ->
      new MainApp.ComparisonQuery.Controller



  App.addInitializer ->
    new MainApp.AppRouter