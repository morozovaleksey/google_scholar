App.module "MainApp.GoogleResponse", (GoogleResponse, App, Backbone, Marionette, $, _) ->

  class GoogleResponse.LayoutView extends App.Base.LayoutView
    events:
      'submit #data-to-evaluate': 'submitForm'
    initialize: ->


    submitForm:(e) ->
      e.preventDefault()
      console.log @$el.find('#amount_relevant').val()
      if @$el.find('#amount_relevant').val() == ""
        @$el.find('#error-message').html("*Введите количество релевантных документов на странице")
        @$el.find('#block-amount-relevant').addClass('has-error')
      else if @$el.find('#amount_all').val() == ""
        @$el.find('#error-message').html("*Введите количество всех на странице")
        @$el.find('#block-amount-all').addClass('has-error')
      else
        response = @googleResponseModel.fetch
          url: Routes.add_to_query_path({ format: 'json', user_email: gon.current_user_email, query: gon.query_string, number_relevant: @$el.find('#amount_relevant').val(), number_all:@$el.find('#amount_all').val(), number_page: gon.number_page, specify_query: $('#relevant_specify_query').val() })
          reset: true
          success: => @showSuccess()

    showSuccess: ->
      @$el.find('#add-data-to-query').addClass('hidden')
      @$el.find('#success-message').removeClass('hidden')
