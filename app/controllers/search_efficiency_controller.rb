class SearchEfficiencyController < ApplicationController

  def evaluation_efficiency
    render json: params["relevant"]
  end

  def evaluate_accuracy

  end
end
