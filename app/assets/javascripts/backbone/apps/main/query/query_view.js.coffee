App.module "MainApp.Query", (Query, App, Backbone, Marionette, $, _) ->

  class Query.LayoutView extends App.Base.LayoutView
    events:
      'submit form': 'submitForm'
      'change #check_author_yes': 'showAuthorField'
      'change #check_author_no': 'hideAuthorField'
      'change #check_intitle_word_yes': 'showIntitleField'
      'change #check_intitle_word_no': 'hideIntitleField'
      'change #check_refinement_of_yes': 'showRefinementOfField'
      'change #check_refinement_of_no': 'hideRefinementOfField'

    initialize: ->
      @dropdownListArea()
      @dropdownListThema()
      @clearField()
      @subjectSelect()
      @termSelect()
      @unnecessarySubjectSelect()
      @unnecessaryTermSelect()

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
      $("#area").val($("#select option:first").val())
      $("#subject").val($("#select option:first").val())
      $("#term").val($("#select option:first").val())
      @$el.find('#area').change =>
        $('#subject').find('option:not(:first)').remove()
        $('#term').find('option:not(:first)').remove()
        @areaModel = App.request "scienceArea:model"
        scienceId = ""
        _(gon.science_area).each (value,key) =>
          if value.name == @$el.find('#area').val()
            scienceId = value.id
        if scienceId != ""
          response = @areaModel.fetch
            url: Routes.related_subjects_path({ format: 'json', name: @$el.find('#area').val(), science_id: scienceId  })
            reset: true
          @areaModel.on "sync", =>
            console.log @areaModel.attributes
            _(@areaModel.attributes).each (value,key) =>
              console.log subject = value.science_subject_name
              @valueSubjectId = value.id
              $("#subject").append( $("<option>#{value.science_subject_name}</option>"))

    termSelect: ->
      @$el.find('#subject').change =>
        $('#term').find('option:not(:first)').remove()
        subjectModel = App.request "scienceSubject:model"
        _(@areaModel.attributes).each (value,key) =>
          if value.science_subject_name == @$el.find('#subject').val()
            @valueSubjectId = value.id
        if @$el.find('#subject').val() != ""
          response = subjectModel.fetch
            url: Routes.related_terms_path({ format: 'json', name: @$el.find('#subject option:selected').text() , subject_id: @valueSubjectId   })
            reset: true
          subjectModel.on "sync", =>
            _(subjectModel.attributes).each (value,key) =>
              $("#term").append( $("<option>#{value.term_name}</option>"))

    unnecessarySubjectSelect: ->
      $("#unnecessary_area").val($("#select option:first").val())
      $("#unnecessary_subject").val($("#select option:first").val())
#      $("#unnecessary_terms").val($("#select option:first").val())
      @$el.find('#unnecessary_area').change =>
        $('#unnecessary_subject').find('option:not(:first)').remove()
        $('#unnecessary_terms').find('option:not(:first)').remove()
        @unnecessaryAreaModel = App.request "scienceArea:model"
        scienceId = ""
        _(gon.science_area).each (value,key) =>
          if value.name == @$el.find('#unnecessary_area').val()
            scienceId = value.id
        if scienceId != ""
          response = @unnecessaryAreaModel.fetch
            url: Routes.related_subjects_path({ format: 'json', name: @$el.find('#area').val(), science_id: scienceId  })
            reset: true
          @unnecessaryAreaModel.on "sync", =>
            console.log @unnecessaryAreaModel.attributes
            _(@unnecessaryAreaModel.attributes).each (value,key) =>
              console.log subject = value.science_subject_name
              @valueSubjectId = value.id
              $("#unnecessary_subject").append( $("<option>#{value.science_subject_name}</option>"))
    unnecessaryTermSelect: ->
      @$el.find('#unnecessary_subject').change =>
        $('#unnecessary_terms').find('option:not(:first)').remove()
        unnecessarySubjectModel = App.request "scienceSubject:model"
        _(@unnecessaryAreaModel.attributes).each (value,key) =>
          if value.science_subject_name == @$el.find('#unnecessary_subject').val()
            @valueSubjectId = value.id
        if @$el.find('#unnecessary_subject').val() != ""
          response = unnecessarySubjectModel.fetch
            url: Routes.related_terms_path({ format: 'json', name: @$el.find('#unnecessary_subject option:selected').text() , subject_id: @valueSubjectId   })
            reset: true
          unnecessarySubjectModel.on "sync", =>

            _(unnecessarySubjectModel.attributes).each (value,key) =>
              console.log value.term_name
              $("#unnecessary_terms").append( $("<option>#{value.term_name}</option>"))
              $('#unnecessary_terms').selectpicker('refresh')

    showAuthorField: ->
      @$el.find('#author-in-article').removeClass('hidden')

    hideAuthorField: ->
      @$el.find('#author-in-article').addClass('hidden')

    showIntitleField: ->
      @$el.find('#word-title-article').removeClass('hidden')

    hideIntitleField: ->
      @$el.find('#word-title-article').addClass('hidden')

    showRefinementOfField: ->
      @$el.find('#refinement-of-article').removeClass('hidden')

    hideRefinementOfField: ->
      @$el.find('#refinement-of-article').addClass('hidden')

    clearField: ->
      console.log @$el.find('#author-in-article').val()










