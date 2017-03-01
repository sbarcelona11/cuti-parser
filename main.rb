# encoding: utf-8
require 'nokogiri'
require 'open-uri'
require 'json'
require_relative 'db/insert_data'

url = []

(1..15).each do | number |
  link = "http://www.cuti.org.uy/socios?sol=&ind=24&cert=&_frm=ff&ajax-pagination=1&pag=#{number}"
  page = Nokogiri::HTML(open(link))
  div_content = page.css('.it').css('.hdr').css('a')

  div_content.each do |page|
    name = page.text
    links = page['href']

    url << {
        name: name,
        url: links
    }
  end
end

array_data = []

url.each do |val|

  page = Nokogiri::HTML(open(val[:url]))
  div_content = page.css('span.info')[1].css('a')

  begin
    email = page.css('span.info')[3].css('a').text
  rescue
  end

  div_content.each do |page|
    link = page['href']

    array_data << {
        name: val[:name],
        email: email,
        url: link
    }
  end
end

##
# save data to database
##
array_data.each do |data|
  CreateDataQuery.new.run(data)
end