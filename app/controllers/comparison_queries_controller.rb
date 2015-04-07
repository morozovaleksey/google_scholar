class ComparisonQueriesController < ApplicationController
  def comparison
    calculate_relevance_simple_query
    calculate_different_simple_query
  end

  def calculate_relevance_simple_query
    simple_queries = Relevance.where(:specify_query => 'no')
    sum_relevance_simple_query = 0.0
    simple_queries.each do |simple_query|
      sum_relevance_simple_query +=simple_query.relevance
    end
    gon.average_relevance_simple_query = average_relevance_simple_query = sum_relevance_simple_query / simple_queries.count
  end

  def calculate_different_simple_query
    difficult_queries = Relevance.where(:specify_query => 'yes')
    sum_relevance_difficult_query = 0.0
    difficult_queries.each do |difficult_query|
      sum_relevance_difficult_query += difficult_query.relevance
    end
    gon.average_relevance_difficult_query = average_relevance_difficult_query = sum_relevance_difficult_query / difficult_queries.count
  end
end
