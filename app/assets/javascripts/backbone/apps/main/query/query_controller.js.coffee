App.module "MainApp.Query", (Query, App, Backbone, Marionette, $, _) ->

  class Query.Controller extends App.Base.Controller

    initialize: (options) ->
      @layoutView = @getLayoutView()
      @showQuery(@layoutView)

    getLayoutView: ->
      new Query.LayoutView
        el: $('#search-region')

    showQuery: (layoutView) ->
      @queryModel = App.request "query:model"
      console.log layoutView.queryModel = @queryModel
      console.log layoutView
      layoutView.on 'query:sent:click', =>
        all_words = @queryModel.attributes.all_words
        if @queryModel.attributes.word_title == ""
          collocation = @queryModel.attributes.collocation
        else
          collocation = "\"#{@queryModel.attributes.collocation}\""
        if @queryModel.attributes.word_title == ""
          word_title = @queryModel.attributes.word_title
        else
          word_title = "intitle:#{@queryModel.attributes.word_title}"
        if @queryModel.attributes.words_title == ""
          words_title = @queryModel.attributes.words_title
        else
          words_title = "allintitle:#{@queryModel.attributes.words_title}"

#        console.log queryString = "#{@queryModel.attributes.all_words} \"#{@queryModel.attributes.collocation}\" intitle:#{@queryModel.attributes.word_title}"
        console.log queryString = "#{all_words} #{collocation} #{word_title} #{words_title}"
        console.log queryString.replace(/\s+/g," ")



