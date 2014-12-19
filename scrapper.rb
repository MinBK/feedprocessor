require 'nokogiri'
require 'open-uri'
require 'json'

module Scrapper
  def self.scrap(url)
    items = []
    
    # Parse the XML and create the Graph representing the XML document
    doc =  Nokogiri::XML.parse(open(url))
    
    # Extract //channel/item or nodeset
    blocks = doc.xpath('//channel/item')
    
    # Extract all the tag elements fromthe blocks
    tag_and_text_arr = blocks.map do |node|
       node.children.map { |child_node| [child_node.name, child_node.text.strip] if child_node.elem? }.compact
    end.compact

    tag_and_text_arr.each do |tag_and_text|
      item = {}
      tag_and_text.each do |result|
        item[result.first] = [] unless item.has_key?(result.first)
        item[result.first] << result.last
      end

      item.each do |key, value|
        value = value.select{|val| !val.empty?}.compact
        item[key] = value.first.to_s if value.size < 2
      end
      items << item
    end
    items
  end
end

