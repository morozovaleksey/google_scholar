App.module "MainApp.SearchEfficiency", (SearchEfficiency, App, Backbone, Marionette, $, _) ->

  class SearchEfficiency.LayoutView extends App.Base.LayoutView
    events:
      'submit form': 'submitForm'
    initialize: ->
      @googlechart()

    submitForm: (e) ->
      e.preventDefault()
      accurancy1 = @$el.find('#same_relevant1').val() / @$el.find('#all_relevant1').val()
      @$el.find('#accurancy1').val("#{accurancy1}")
      accurancy2 = @$el.find('#same_relevant2').val() / @$el.find('#all_relevant2').val()
      @$el.find('#accurancy2').val("#{accurancy2}")
      accurancy3 = @$el.find('#same_relevant3').val() / @$el.find('#all_relevant3').val()
      @$el.find('#accurancy3').val("#{accurancy3}")
      console.log accurancy4 =  @$el.find('#same_relevant4').val() / @$el.find('#all_relevant4').val()
      console.log @$el.find('#accurancy4').val("#{accurancy4}")

    googlechart: ->
      google.setOnLoadCallback(@drawChart)

    drawChart: ->
      data = google.visualization.arrayToDataTable([
        [
          "Year"
          "Sales"

        ]
        [
          "20"
          200


        ]
        [
          "200"
          400


        ]
      ])
      options =
        title: "Точность"
        curveType: "function"
        legend:
          position: "bottom"

      chart = new google.visualization.LineChart(document.getElementById("curve_chart"))
      chart.draw data, options


