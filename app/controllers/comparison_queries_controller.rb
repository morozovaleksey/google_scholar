class ComparisonQueriesController < ApplicationController
  def comparison
    simple_queries = Relevance.where(:specify_query => 'no')
    sum_relevance_simple_query = 0
    simple_queries.each do |query|
      sum_relevance_simple_query +=query.relevance
    end
    gon.average_relevance_simple_query = average_relevance_simple_query = sum_relevance_simple_query / simple_queries.count

    difficult_queries = Relevance.where(:specify_query => 'yes')
    sum_relevance_difficult_query = 0
    difficult_queries.each do |query|
      sum_relevance_difficult_query +=query.relevance
    end
    gon.average_relevance_difficult_query = average_relevance_difficult_query = sum_relevance_difficult_query / difficult_queries.count

  end
end
