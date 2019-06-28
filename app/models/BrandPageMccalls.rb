
class BrandPageMccalls
  attr_reader :title_hash, :link_hash

  def initialize(brand, search)
    @brand = brand
    @search = search
    @url_2 = "https://#{@brand}.mccall.com/"
    @url = "https://#{@brand}.mccall.com/patterns/#{search}/all?page=all"
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
      name_list << data.text.strip
    end 
    name_list
  end

  def pattern_page_search
    last = ""
    @name_list.each do |name|
      @brand = "mccall" if @brand == "mccallpattern" 
      last = PatternsPageMccalls.new(@brand, name, @search)
    end
  end

  def sale
    sale = ""
  end
end


