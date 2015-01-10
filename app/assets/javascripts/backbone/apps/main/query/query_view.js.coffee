App.module "MainApp.Query", (Query, App, Backbone, Marionette, $, _) ->

  class Query.LayoutView extends App.Base.LayoutView
    events:
      'submit form': 'submitForm'
    initialize: ->
      @dropdownListArea()
      @dropdownListThema()
      @$el.find('#theme').find('.selectpicker').find('option')

    dropdownListArea: ->
      area = @$el.find('#area')

    dropdownListThema: ->
      theme = @$el.find('#theme')
      gon.array2
      _(gon.array2).each (value,key) =>
        console.log value
        _(value).each (value) =>
          theme.append( $('<option>'+value+'</option>') )

    submitForm: (e) ->
      e.preventDefault()
      console.log "Submit"
      console.log @queryModel.set
        "all_words": @$el.find('#all_words').val()
        "collocation": @$el.find('#collocation').val()
        "word_title": @$el.find('#word_title').val()
        "words_title": @$el.find('#words_title').val()
      if @$el.find('#file_type').val() == "Тип файлов выдачи"
        @queryModel.set
          "fyle_type": ''
      else
        @queryModel.set
          "fyle_type": @$el.find('#file_type').val()
      @trigger 'query:sent:click'
#      theme = $('#theme option:selected').val()

#      console.log query = all_words+ ' ' + collocation+ ' '
#    onRender: ->
#      rivets.bind @$el, { query: @model }








