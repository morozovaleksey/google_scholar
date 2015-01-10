class GoogleScholarParser

  def self.parse

    headers = { "User-Agent" => "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36" }
    page = Nokogiri::HTML.parse(HTTParty.get('http://scholar.google.com/scholar?hl=ru&as_sdt=0,5&q=planet+Mars', headers: headers))

    Hash[page.xpath("/html/body/div[1]/div[6]/div/div[2]/div[1]/div/h3/a").map {|link| [link.text.strip, link["href"]]}]
    # element = page.xpath("/html/body/div[1]/div[6]/div/div[2]/div[1]/div/h3/a").map { |link| link['href'] }
    # element = page.xpath("/html/body/div[1]/div[6]/div/div[2]/div[1]/div/h3").text



    # output = []
    # col = row = 0
    #
    # page.xpath("//*[@class='table-cell']").each do |cell|
    #   output[row] = { rank: nil, grade: nil, username: nil, media: nil, followers: nil, following: nil} unless output[row]
    #   case col
    #     when 0 then output[row][:rank] = cell.xpath('text()')[0].text
    #     when 1 then output[row][:grade] = cell.xpath('.//span/text()')[0].text
    #     when 2 then output[row][:username] = cell.xpath('.//a/text()')[0].text
    #     when 3 then output[row][:media] = cell.xpath('text()')[0].text
    #     when 4 then output[row][:followers] = cell.xpath('text()')[0].text
    #     when 5 then output[row][:following] = cell.xpath('text()')[0].text
    #   end
    #   if col == 5 then col = 0; row = row.next else col = col.next end
    # end
    #
    # output

  end

end