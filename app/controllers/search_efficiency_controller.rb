class SearchEfficiencyController < ApplicationController

  def evaluation_efficiency
    gon.query_string = @query_string = params["accuracy"]["query_string"]
    gon.specify_query = @specify_query = params["accuracy"]["specify_query"]
    gon.current_user_email = current_user.email
    query_record = Query.where(user_email: current_user.email).where(query: @query_string)
    count_analyzing = Query.where(user_email: current_user.email).where(query: @query_string).count
    if count_analyzing < 5
      num_pages = ""
      query_record.each do |record|
        num_pages += "#{record.number_page.to_s} "
      end
      num_pages = num_pages.split
      pages = ""
      num_pages.each do |number|
        pages += "страница #{number.to_s}; "
      end
      @error_message = "Просмотрите пожалуйства 5 страниц. Вы просмотрели всего #{count_analyzing} страниц. Просмотрены #{pages}"
    else
      @page1 = Query.where(user_email: current_user.email).where(query: @query_string).where(number_page:1)
      gon.page1_number_relevant = page1_number_relevant = @page1[0].number_relevant
      gon.page1_number_all = page1_number_all = @page1[0].number_all
      @page2 = Query.where(user_email: current_user.email).where(query: @query_string).where(number_page:2)
      gon.page2_number_relevant = page2_number_relevant = @page2[0].number_relevant
      gon.page2_number_all = page2_number_all = @page2[0].number_all
      @page3 = Query.where(user_email: current_user.email).where(query: @query_string).where(number_page:3)
      gon.page3_number_relevant = page3_number_relevant =  @page3[0].number_relevant
      gon.page3_number_all = page3_number_all = @page3[0].number_all
      @page4 = Query.where(user_email: current_user.email).where(query: @query_string).where(number_page:4)
      gon.page4_number_relevant = page4_number_relevant =  @page4[0].number_relevant
      gon.page4_number_all = page4_number_all = @page4[0].number_all
      @page5 = Query.where(user_email: current_user.email).where(query: @query_string).where(number_page:5)
      gon.page5_number_relevant = page5_number_relevant = @page5[0].number_relevant
      gon.page5_number_all = page5_number_all = @page5[0].number_all
      gon.relevant_coefficient = @relevant_coefficient = ((((page1_number_relevant.to_f / page1_number_all.to_f) * 5)/ 15 +
                 ((page2_number_relevant.to_f / page2_number_all.to_f) *4)/15 +
                 ((page3_number_relevant.to_f / page3_number_all.to_f) *3)/15 +
                 ((page4_number_relevant.to_f / page4_number_all.to_f) *2)/15 +
                 ((page5_number_relevant.to_f / page5_number_all.to_f) *1)/15) * 100).round(2)
      gon.accuracy1 = accuracy = (page1_number_relevant.to_f / page1_number_all.to_f) * 100
      gon.accuracy2 = accuracy = (page2_number_relevant.to_f / page2_number_all.to_f) * 100
      gon.accuracy3 = accuracy = (page3_number_relevant.to_f / page3_number_all.to_f) * 100
      gon.accuracy4 = accuracy = (page4_number_relevant.to_f / page4_number_all.to_f) * 100
      gon.accuracy5 = accuracy = (page5_number_relevant.to_f / page5_number_all.to_f) * 100
      @average_accuracy = ((((page1_number_relevant.to_f / page1_number_all.to_f) +
                          (page2_number_relevant.to_f / page2_number_all.to_f) +
                          (page3_number_relevant.to_f / page3_number_all.to_f) +
                          (page4_number_relevant.to_f / page4_number_all.to_f) +
                          (page5_number_relevant.to_f / page5_number_all.to_f))/5) * 100).round(2)
      @comparison_relevant_query =  Relevance.where(user_email: current_user.email)
      if Relevance.where(:user_email => current_user.email).where(:query => @query_string).limit(1).blank?
        Relevance.create(:user_email => current_user.email, :query => @query_string, :relevance => @relevant_coefficient,:specify_query => @specify_query)
      else
        relevance_record = Relevance.where(:user_email => current_user.email).where(:query => @query_string).limit(1)
        relevance_record.update(relevance_record[0].id,:relevance => @relevant_coefficient)
      end
    end
    # render json: params
  end

  def add_to_query
      if Query.where(user_email: params[:user_email]).where(query: params[:query]).where(number_page:params[:number_page]).blank?
        render json: Query.create(:user_email => params[:user_email], :query => params[:query], :number_relevant => params[:number_relevant], :number_all => params[:number_all], :number_page => params[:number_page])
      else
        query = Query.where(user_email: params[:user_email]).where(query: params[:query]).where(number_page:params[:number_page])
        render json: query.update(query[0].id,:number_relevant => params[:number_relevant], :number_all => params[:number_all])
      end
  end

  def get_relevance
    # render text: params
    render json: Relevance.where(user_email: params[:user_email]).where(query: params[:query])
  end
end
