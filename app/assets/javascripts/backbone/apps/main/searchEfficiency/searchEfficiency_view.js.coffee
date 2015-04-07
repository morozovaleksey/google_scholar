App.module "MainApp.SearchEfficiency", (SearchEfficiency, App, Backbone, Marionette, $, _) ->

  class SearchEfficiency.LayoutView extends App.Base.LayoutView
    events:
      'submit form': 'submitForm'
    initialize: ->
      @googlechart()

      @selectQuery()

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

    selectQuery: ->

      relevanceModel = App.request "relevance:model"
      @$el.find('#comparison_query').change =>
        console.log query_string = @$el.find('#comparison_query option:selected').text()
        query_string = $.trim(query_string)
        console.log response = relevanceModel.fetch
          url: Routes.get_relevance_path({ format: 'json', user_email: gon.current_user_email, query: query_string })
          reset: true
        relevanceModel.on "sync", =>
          console.log @relevance = relevanceModel.attributes[0].relevance
          console.log @comparissonQuery = relevanceModel.attributes[0].query
          @googleRelevanceChart()



    googlechart: ->
      google.load("visualization", "1", {packages:["corechart"]})
      google.setOnLoadCallback(@drawChart)

    googleRelevanceChart: ->
      google.load("visualization", "1", {packages:["corechart"]})
      google.setOnLoadCallback(@drawRelevanceChart())


    drawChart: ->
      data = google.visualization.arrayToDataTable([
        [
          "Element"
          "Точность"
          {
            role: "style"
          }
        ]
        [
          "Страница 1"
          gon.accuracy1
          "#b87333"
        ]
        [
          "Страница 2"
          gon.accuracy2
          "silver"
        ]
        [
          "Страница 3"
          gon.accuracy3
          "gold"
        ]
        [
          "Страница 4"
          gon.accuracy4
          "color: #e5e4e2"
        ]
        [
          "Страница 5"
          gon.accuracy5
          "color: #e4f4e6"
        ]
      ])
      view = new google.visualization.DataView(data)
      view.setColumns [
        0
        1
        {
          calc: "stringify"
          sourceColumn: 1
          type: "string"
          role: "annotation"
        }
        2
      ]
      options =
        title: "Точность поиска по страницам, %"
        width: 600
        height: 400
        bar:
          groupWidth: "95%"

        legend:
          position: "none"

      chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"))
      chart.draw view, options

    drawRelevanceChart: ->

      data = google.visualization.arrayToDataTable([
        [
          "Element"
          "Релевантность"
          {
            role: "style"
          }
        ]
        [
          "Запрос: #{gon.query_string}"
          gon.relevant_coefficient
          "#b87333"
        ]
        [
          "Запрос: #{@comparissonQuery}"
          @relevance
          "silver"
        ]
      ])
      view = new google.visualization.DataView(data)
      view.setColumns [
        0
        1
        {
          calc: "stringify"
          sourceColumn: 1
          type: "string"
          role: "annotation"
        }
        2
      ]
      options =
        title: "Взвешенный показатель точности по запросу, %"
        width: 600
        height: 400
        bar:
          groupWidth: "95%"

        legend:
          position: "none"

      console.log chart = new google.visualization.ColumnChart(document.getElementById("columnchart_relevance_values"))
      chart.draw view, options



