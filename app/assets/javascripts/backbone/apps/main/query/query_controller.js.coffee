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
        allWords = @queryModel.attributes.allWords
        if @queryModel.attributes.collocation == ""
          collocation = @queryModel.attributes.collocation
        else
          collocation = "\"#{@queryModel.attributes.collocation}\""
        if @queryModel.attributes.wordTitle == ""
          wordTitle = @queryModel.attributes.wordTitle
        else
          wordTitle = "intitle:#{@queryModel.attributes.wordTitle}"
        if @queryModel.attributes.wordsTitle == ""
          wordsTitle = @queryModel.attributes.wordsTitle
        else
          wordsTitle = "allintitle:#{@queryModel.attributes.wordsTitle}"
        if @queryModel.attributes.fyleType == ""
          fyleType = @queryModel.attributes.fyleType
        else
          fyleType = "filetype:#{@queryModel.attributes.fyleType}"

        console.log @queryModel.attributes.sciency_area

        queryString = "#{allWords} #{collocation} #{wordTitle} #{wordsTitle} #{fyleType}"
        queryString = queryString.replace(/\s+/g," ")
        queryString = $.trim(queryString)
        queryString = encodeURIComponent(queryString)
        url = 'http://scholar.google.com/scholar?q='+queryString
#        window.open(url,'GScholar')
#        @saveQuery()

    saveQuery: ->
      console.log  @queryModel.attributes
#        type: "post"
#        success: (model, response) =>
#         console.log "success"
#        error: (model, response) =>
#          console.log "error"




