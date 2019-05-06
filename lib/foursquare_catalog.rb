require 'open-uri'
require 'nokogiri'
module FoursquareCatalog
  class Information
    def initialize(type_name, url, options = {})
      @type_name = type_name
      @url = url
      @css_block = options[:css_block]
      @css_name = options[:css_name]
      @css_address = options[:css_address]
      @foursquare_id = options[:foursquare_id]
    end

    def parse
      html_body.map do |place|
        {
            name: format(place, @css_name),
            type_name: @type_name,
            foursquare_id: @foursquare_id,
            address: format(place, @css_address)
        }
      end
    end

    private

    def format(place, block)
      place.css(block).map { |n| n.text.strip.to_s }.join(' ')
    end

    def html_body
      Nokogiri::HTML(open(@url)).css(@css_block)
    end
  end
end
