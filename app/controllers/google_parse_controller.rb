class GoogleParseController < ApplicationController

  def google_response
    query = params[:query]
    all_words = query['all_words']
    if query['collocation']== ""
      collocation = query['collocation']
    else
      collocation = "\"#{query['collocation']}\""
    end
    if query['word_title']== ""
      word_title = query['word_title']
    else
      word_title = "intitle:#{query['word_title']}"
    end
    if query['words_title']== ""
      words_title = query['words_title']
    else
      words_title = "intitle:#{query['words_title']}"
    end
    if query['file_type']==""
      file_type = query['fyle_type']
    else
      file_type = "filetype:#{query['fyle_type']}"
    end
    term = "\"#{query['term']}\""
    query_string = "#{all_words} #{collocation} #{word_title} #{words_title} #{file_type} #{term}"
    @count = parsing  query_string
  end

  def parsing query_string
    query_string = URI.encode query_string
    headers = { "User-Agent" => "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36" }
    page = Nokogiri::HTML.parse(HTTParty.get("http://scholar.google.com.ua/scholar?start=0&q=#{query_string}&hl=ru&as_sdt=0,5", headers: headers))
    # render text: Nokogiri::HTML(open("http://scholar.google.com.ua/", :proxy => 'http://(217.6.254.155):(80)', headers: headers))

    # page = Nokogiri::HTML.parse(HTTParty.get("http://scholar.google.com.ua/scholar?q=cosmos&btnG=&hl=ru&as_sdt=0%2C5", headers: headers))

    # if count.to_i > 10
      #   page = Nokogiri::HTML.parse(HTTParty.get("http://scholar.google.com.ua/scholar?start=0&q=#{query_string}&hl=ru&as_sdt=0,5", headers: headers))
      #   google_hash = Hash[page.xpath("/html/body/div[1]/div[6]/div/div[2]/div/div/h3/a").map {|link| [link.text.strip, link["href"]]}]
      # end
    # end
    render json: Hash[page.xpath("/html/body/div[1]/div[6]/div/div[2]/div/div/h3/a").map {|link| [link.text.strip, link["href"]]}]
    # page.xpath("/html/body/div[1]/div[5]/div[1]").text.split[2]
  end


end
