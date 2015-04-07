class GoogleScholarParser

  def self.parse
    headers = { "User-Agent" => "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36" }
    page = Nokogiri::HTML.parse(HTTParty.get("http://forensics.ru/teza.html", headers: headers))
  end

end