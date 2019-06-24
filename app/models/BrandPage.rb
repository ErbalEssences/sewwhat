require 'nokogiri'
require 'open-uri'
require "./PatternsPageMccalls.rb"




class BrandPageMccalls
  attr_reader :title_hash, :link_hash

  def initialize(brand)
    search = ["plus-sizes", "misses", "accessories", "aprons", "kids", "family-sleepwear", "swimwear", "costumes", "uniforms", "men", "crafts-dolls-pets", "home-decorating", "out-of-print"]
    @brand = brand
    @url_2 = "https://#{@brand}.mccall.com/"
    # @url = "https://#{@brand}.mccall.com/patterns/#{search}/all?page=all"
    @url = "https://#{@brand}.mccall.com/patterns/misses/all?page=all"
    @title_hash = {}
    @link_hash = {}
    @doc = fetch!
    @name_list = patterns_search
    pattern_page_search
  end

  def fetch!
    @doc = Nokogiri::HTML(open(@url))
  end

  def patterns_search
    name_list = []
    @doc.css("div.field-name-title").each do |data|
      name_list << data.text
    end 
    name_list
  end

  # def price_search
  #   @display_name.split("/").each do |tag|
  #     tags += tag.split(" ")
  #   end
  #   @doc.css("div.field-tag-title h1").each do |tag| 
  #     return tag.text
  #   end 
  # end

  def pattern_page_search
    last = ""
    @name_list.each do |name|
      last = PatternsPageMccalls.new(@brand, name)
    end
    last.new_tags_check
    p last.new_tags_check
  end

  def sale
    sale = ""
  end
end


BrandPageMccalls.new('butterick')
# test_page = PatternsPageMccalls.new('butterick', 'b6675')
# test_page2 = PatternsPageMccalls.new('mccallpattern', 'm7961')
# test_page3 = PatternsPageMccalls.new('voguepatterns', 'v9373')
# test_page.pattern
# test_page2.pattern
# test_page3.pattern
# test_page.other_search

# test_page4 = Patterns_page.new("https://butterick.mccall.com/")


# @base_url = "https://#{brand}.mccall.com/#{pattern_number}"

# brands = ["mccallpattern", "butterick", "voguepatterns"]
# test_page4 = Brand_page.new()
# test_page4.patterns_search


#indie "https://butterick.mccall.com/patterns/indie-patterns?page=all"



# butterick_1 = Pattern.create(name: "B6675", display_name: "Misses'/Women's Dress", url: "https://butterick.mccall.com/b6675", price: 11.97, out_of_print: false)
