require 'nokogiri'
require 'open-uri'
require_relative 'recipe'

class Parsing
  def initialize(ingredient)
    @ingredient = ingredient
  end

  def call
    url = "https://www.allrecipes.com/search/results/?search=#{@ingredient}"
    html_doc = Nokogiri::HTML(open(url), nil, 'utf-8')

    result = []

    html_doc.search('.card__recipe').first(5).each do |element|
      name = element.search('.card__title').text.strip
      description = element.search('.card__summary').text.strip
      rating = element.search('.review-star-text').text.match(/\d/)
      result << Recipe.new(name, description, rating)
    end
    result
  end
end
