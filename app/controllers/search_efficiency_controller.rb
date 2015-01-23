class SearchEfficiencyController < ApplicationController

  def evaluation_efficiency

  end

  def add_to_query
    render json: Query.create(:user_email => params[:user_email], :query => params[:query], :number_relevant => params[:number_relevant], :number_all => params[:number_all], :number_page => params[:number_page] )
    # render json: Query.create(:user_email => params[:user_email])
  end
end
