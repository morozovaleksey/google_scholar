App.module "MainApp.Query", (Query, App, Backbone, Marionette, $, _) ->

  class Query.LayoutView extends App.Base.LayoutView
    events:
      'submit form': 'submitForm'
    initialize: ->
      @dropdownListArea()
      @dropdownListThema()
#      @$el.find('#theme').find('.selectpicker').find('option')
      @subjectSelect()
      @termSelect()

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
#      e.preventDefault()
      console.log "Submit"
      console.log @queryModel.set
        "allWords": @$el.find('#all_words').val()
        "collocation": @$el.find('#collocation').val()
        "wordTitle": @$el.find('#word_title').val()
        "wordsTitle": @$el.find('#words_title').val()
      if @$el.find('#file_type').val() == "Тип файлов"
        @queryModel.set
          "fyleType": ""
      else
        @queryModel.set
          "fyleType": @$el.find('#file_type').val()
      @queryModel.set
        "sciency_area": @$el.find('#area').val()
      @trigger 'query:sent:click'
#      theme = $('#theme option:selecTted').val()

#      console.log query = all_words+ ' ' + collocation+ ' '
    subjectSelect: ->
      @$el.find('#area').change =>
        $('#subject').find('option:not(:first)').remove()
        $('#term').find('option:not(:first)').remove()
        areaModel = App.request "scienceArea:model"
        scienceId = ""
        _(gon.science_area).each (value,key) =>
          if value.name == @$el.find('#area').val()
            scienceId = value.id
        response = areaModel.fetch
          url: Routes.related_subjects_path({ format: 'json', name: @$el.find('#area').val(), science_id: scienceId  })
          reset: true
        areaModel.on "sync", =>
          console.log areaModel
          console.log @$el.find('#subject').val()
          _(areaModel.attributes).each (value,key) =>
            console.log subject = value.science_subject_name
            $("#subject").append( $("<option value=\"#{value.id}\">#{value.science_subject_name}</option>"))

    termSelect: ->
      @$el.find('#subject').change =>
        $('#term').find('option:not(:first)').remove()
        subjectModel = App.request "scienceSubject:model"

        response = subjectModel.fetch
          url: Routes.related_terms_path({ format: 'json', name: @$el.find('#subject option:selected').text() , subject_id: @$el.find('#subject').val()   })
          reset: true
        subjectModel.on "sync", =>
          console.log subjectModel
          _(subjectModel.attributes).each (value,key) =>
            console.log subject = value.science_subject_name
            $("#term").append( $("<option>#{value.term_name}</option>"))

#    onRender: ->
#      rivets.bind @$el, { query: @model }








