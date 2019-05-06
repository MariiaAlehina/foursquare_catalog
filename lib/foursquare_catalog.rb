require 'open-uri'
require 'nokogiri'
module FoursquareCatalog
  class Information
    def initialize(type_name, type_url, options = {})
      @type_name = type_name
      @url = type_url
      @css_block = options[:css_block]
      @css_name = options[:css_name]
      @css_address = options[:css_address]
      @foursquare_id = options[:foursquare_id]
    end

    def parse
      html_body.map do |place|
        [
            format(place, @css_name),
            @type_name,
            format(place, @css_address),
            @foursquare_id
        ]
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
