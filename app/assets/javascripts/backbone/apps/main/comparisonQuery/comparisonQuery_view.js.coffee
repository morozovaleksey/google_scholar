App.module "MainApp.ComparisonQuery", (ComparisonQuery, App, Backbone, Marionette, $, _) ->

  class ComparisonQuery.LayoutView extends App.Base.LayoutView

    initialize: ->
      @googleComparisonChart()

    onRender: ->
      console.log "sfdgd"

    googleComparisonChart: ->
      google.load("visualization", "1", {packages:["corechart"]})
      google.setOnLoadCallback(@drawComparisonChart())

    drawComparisonChart: ->
      drawRelevanceChart: ->

      data = google.visualization.arrayToDataTable([
        [
          "Element"
          "Взвешенная точность"
          {
            role: "style"
          }
        ]
        [
          "Простой запрос: "
          gon.average_relevance_simple_query
          "#b87333"
        ]
        [
          "Расширенный запрос: "
          Number(gon.average_relevance_difficult_query).toFixed(2)
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
        title: "Сравнительная оценка простых и расширенных запросов, %"
        width: 600
        height: 400
        bar:
          groupWidth: "95%"

        legend:
          position: "none"

      console.log chart = new google.visualization.ColumnChart(document.getElementById("columnchart_comparison_values"))
      chart.draw view, options