require 'nokogiri'
require 'open-uri'

url = "https://www.lewagon.com/campuses"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

cities = html_doc.search('.city-card-details h3').map do |element|
  element.text.strip
end

p cities
