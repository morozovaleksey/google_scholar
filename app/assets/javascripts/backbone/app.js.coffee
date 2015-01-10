@App = do (Backbone, Marionette) ->

  App = new Marionette.Application()
  App.redirect = (path) ->
    window.location.replace path
  App.reloadPage = (options = {}) ->
    location.reload()
  App.on 'start', ->
    Backbone.history.start( pushState: true ) if Backbone.history

$(document).on 'ready', -> App.start()