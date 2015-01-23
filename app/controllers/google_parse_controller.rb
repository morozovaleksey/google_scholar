include ActionView::Helpers::SanitizeHelper
class GoogleParseController < ApplicationController

  def google_response
    if params[:number_page].nil?
      query = params[:query]
      if query['author'] == ""
        author = query['author']
      else
        author = "author:#{query['author']}"
      end
      all_words = query['all_words']
      if query['collocation']== ""
        collocation = query['collocation']
      else
        collocation = "\"#{query['collocation']}\""
      end
      intitle = ""
      if query['word_title']== ""
        intitle = query['word_title']
      else
        query['word_title'].split.each do |word|
          intitle += "intitle:#{word} "
        end
      end
      if query['file_type']==""
        file_type = query['file_type']
      else
       file_type = "filetype:#{query['file_type']}"
      end
      if query['check_area'] == "1"
        if query['area'] != ""
          area = "\"#{query['area']}\""
        end
      else
        area = ""
      end
      if query['check_subject'] == "1"
        if query['subject'] != ""
          subject = "\"#{query['subject']}\""
        end
      else
        subject = ""
      end
      if query['check_term'] == "1"
        if query['term'] != ""
          term = "\"#{query['term']}\""
        end
      else
        term = ""
      end
      ###############################################
      if query['check_unnecessary_area'] == "1"
        if query['unnecessary_area'] != ""
          unnecessary_area = query['unnecessary_area']
          unnecessary_area = unnecessary_area.split(" ")
          unnecessary_area.each_with_index do|area,index|
            unnecessary_area[index] = "-#{area}"
          end
          unnecessary_area = unnecessary_area.map{ |i|  %Q(#{i}) }.join(' ')
        end
      else
        unnecessary_area = ""
      end
      if query['check_unnecessary_subject'] == "1"
        if query['unnecessary_subject'] != ""
          unnecessary_subject = query['unnecessary_subject']
          unnecessary_subject = unnecessary_subject.split(" ")
          unnecessary_subject.each_with_index do|subject,index|
            unnecessary_subject[index] = "-#{subject}"
          end
          unnecessary_subject = unnecessary_subject.map{ |i|  %Q(#{i}) }.join(' ')
        end
      else
        unnecessary_subject = ""
      end
      query_unnecessary_terms = query['unnecessary_terms'].reject(&:empty?)
      unnecessary_term = []
      if query['check_unnecessary_term'] == "1"
        query_unnecessary_terms.each_with_index do |term, index|
            unnecessary_term[index] = "-#{term}"
        end
        unnecessary_term.reject(&:empty?)
        unnecessary_term = unnecessary_term.map{ |i|  %Q(#{i}) }.join(' ')
      else
        unnecessary_term = ""
      end

      query_string = "#{author} #{collocation} #{all_words} #{intitle} #{file_type} #{area} #{subject} #{term} #{unnecessary_area} #{unnecessary_subject} #{unnecessary_term}"
      @query_string = query_string.strip
      @response = parsing  query_string,0
    else
      number_page = params[:number_page]
      number = number_page['number']
      if number.to_i == 1
        number = 0
      end
      if number.to_i == 2
        number = 10
      end
      if number.to_i == 3
        number = 20
      end
      if number.to_i == 4
        number = 30
      end
      if number.to_i == 5
        number = 40
      end
      @query_string =  number_page['query_string']
      @response = parsing  @query_string, number
    end
  end

  def get_number_page

  end

  def parsing query_string, page_number
    @page_number = page_number
    query_string = URI.encode query_string
    headers = { "User-Agent" => "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.37" }
    page = Nokogiri::HTML.parse(HTTParty.get("http://scholar.google.com.ua/scholar?start=#{page_number}&q=#{query_string}&hl=ru&as_sdt=0,5&as_vis=1", headers: headers))
    # render text: Nokogiri::HTML(open("http://scholar.google.com.ua/", :proxy => 'http://(217.6.254.155):(80)', headers: headers))
    # Hash[page.xpath("/html/body/div[1]/div[6]/div/div[2]/div/div/h3/a").map {|link| [link.text.strip, link["href"]]}]
    responce_hash = {}
    responce_hash ={:text_result => Hash[page.xpath("/html/body/div[1]/div[6]/div/div[2]/div/div/h3/a").map {|link| [link.text.strip, link["href"]]}] }
    responce_hash.merge!(:count_result => page.xpath("/html/body/div[1]/div[5]/div[1]").text.split[2])
    # snippet_result = {}
    # snippet_result = {:snippet =>  Hash[page.xpath("/html/body/div[1]/div[6]/div/div[2]/div/div/div").map {|snippet| [snippet.text.strip, snippet["gs_rs"]]}]}
    # responce_hash.merge!(snippet_result)
    # Hash[page.xpath("/html/body/div[1]/div[6]/div/div[2]/div/div/div").map {|snippet| [snippet.text.strip, snippet["gs_rs"]]}]
    # render json: responce_hash
    # text_result = page.xpath("/html/body/div[1]/div[5]/div[1]")
    # count_result = page.xpath("/html/body/div[1]/div[5]/div[1]").text.split[2]

  end


end
