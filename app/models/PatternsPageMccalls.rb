
class PatternsPageMccalls
  attr_reader :title_hash, :link_hash, :images, :line_art, :name, :display_name, :description, :url
  # @@current_tags = Tags.all.search(name:)
  @@current_tags = [ 

      "Very Easy",
      "Cardigan",
      "Shawl",
      "Kimono",
      "Jacket",
      "Skirt",
      "V-neck",
      "Shirt",
      "Top",
      "Invisible Zipper",
      "Skirt",
      "Children",
      "Floor-length Train",
      "Blouse",
      "Vest",
      "Jumpsuit",
      "Pleated Sash",
      "Corset-style Lacing",
      "Corset",
      "Fit and Flare",
      "Wrist-length",
      "Romper",
      "Elastic-Waist",
      "Flutter Sleeve",
      "Nightgown",
      "Overalls",
      "Open-Back",
      "Pillbox",
      "Beret",
      "Oversized Bow",
      "Bow",
      "Sun Hats",
      "Gloves",
      "Belt",
      "Petite",
      "Crew-Neck",
      "Capris",
      "Sleeveless",
      "Twist-Front",
      "Detachable Sleeves",
      "No Seams",
      "High-Low",
      "Gathered-Bust",
      "Tiered",
      "Shaped",
      "Dropped-waist",
      "Raglan Sleeve",
      "Yoke-Detail",
      "Halter",
      "One-Piece",
      "Tunic",
      "Tank",
      "Stand-Up Collar",
      "Dolman Sleeves",
      "Gathered-Front",
      "Keyhole",
      "Princess Seams",
      "Wrong Side Of Fabric Will Show",
      "V-Neck",
      "Loose-fitting",
      "Bust Pocket",
      "Mandarin Collar",
      "Midriff",
      "Coat",
      "Empire-Waist",
      "Sweetheart-Neckline",
      "Doll",
      "Stretch Knits Only",
      "Side Zipper",
      "Average",
      "Side Seam", 
      "Slit",
      "Flounce",
      "Wrap",
      "Women's",
      "Evening",
      "Bridal",
      "Retro",
      "Suits",
      "Coordinates",
      "Jackets",
      "Vests",
      "Coats",
      "Capes",
      "Tops",
      "Skirts",
      "Jumpsuits",
      "Maternity",
      "All Misses",
      "Plus Sizes",
      "Accessories",
      "Aprons",
      "Kids",
      "Family Sleepwear",
      "Swimwear",
      "Costumes",
      "Uniforms",
      "Men",
      "Crafts",
      "Dolls",
      "Pets",
      "Home Decorating",
      "Indie",
      "Butterick",
      "Misses'",
      "Fitted",
      "Back Opening",
      "Tie Closures",
      "Dress",
      "Asymmetrical Hem",
      "Flared Skirt",
      "Tie Closures",
      "Elasticized Back",
      "Easy",
      "Ruffle",
      "Exposed-Dart",
      "Oversized",
      "Mock-neck",
      "Two-way Stretch Knits Onlys",
      "Gathered-Yoke",
      "Mock-pockets",
      "Leggings",
      "Asymmetrical-Zip",
      "A-Line",
      "Cowl-Neck",
      "Bias",
      "circa 1941",
      "Mock-sleeve",
      "Vogue",
      "Special Occasion",
      "High Collar",
      "Pleat",
      "Back Zipper",
      "Fully Lined",
      "Mccall's",
      "Shorts",
      "Pants",
      "Flared",
      "Front Zipper",
      "Pockets",
      "Semi-fitted",
      "Loose Fitting",
      "Button Front",
      "Elasticized Waist",
      "Notched Collar",
      "Slit",
      "Bodice",
      "Shaped Hem",
      "Hood",
      "Elasticized Leg",
      "Pullover",
      "Kimono Sleeve",
      "Elastic Waist",
      "Bodice Underlay",
      "Inner Casing",
      "Advanced",
      "Girls",
      "High Low",
      "Raised Waist",
      "Lined",
      "Petticoat",
      "Sleeveless",
      "Peter Pan Collar",
      "Lining Shows",
      "Tiers",
      "Gown",
      "Veil",
      "Zipper",
      "Maxi",
      "Collar With Drawstring",
      "Mock-back",
      "Flutter Sleeves" ]
  @@new_tags = []
  

  def initialize(brand, pattern_number, search)
    @url = "https://#{brand}.mccall.com/#{pattern_number}"
    @@current_tags 
    @title_hash = {}
    @link_hash = {}
    @doc = fetch!
    @search = search
    @brand = brand
    @images = images_search
    @line_art = line_art_search
    @pattern_number = pattern_number
    @name = pattern_number
    @display_name = display_name_search 
    @description = ""
    @online_only = false
    @out_of_print = out_of_print_search?
    @price = price_search
    @tags = tag_search
    @@new_tags
    @description
    @@new_tags = []
    send_to_database
  end

  def fetch!
    @doc = Nokogiri::HTML(open(@url))
  end

  def new_tags
    @@new_tags
  end

  def patterns_search
    name_list = []
    @doc.css("div.field-name-title").each do |data|
      name_list << data.text
    end 
    name_list
  end

  def name_search
    @doc.css("div.field-name-title h1").each do |name| 
      return name.text
    end 
  end

  def display_name_search
    @doc.css("div.field-name-field-subtitle").each do |name| 
      return name.text
    end 
  end

  def images_search
    images = []
    @doc.css("div.royalslider-item").each do |image_data| 
      image_data.each do |image| 
        images << image[1] if image[0] == 'data-large-url'
      end
    end 
    images
  end

  def line_art_search
    @doc.css("div.field-name-field-line-art").css("img").each do |image_data|
      image_data.each do |image| 
        return image[1] if image[0] == 'src'
      end
    end 
  end

  def tag_search
    tags = []
    if @brand == "mccallpattern"
      tags = ["Mccall's"]
    elsif @brand == "voguepatterns"
      tags = ["Vogue"]
    elsif @brand == "mccallpattern"
      tags = ["Butterick"]
    end
    p @search.titleize
    tags << @search.titleize unless @search == "crafts-dolls-pets"
    filler_name = ""
    @@current_tags.each do |old|
      filler_name = display_name_search
      filler_name.slice! "/ "
      if filler_name.include? old
        filler_name.slice! old
        unless tags.include? old
          tags << old
        end
      end
    end
    @@new_tags << filler_name

    @doc.css("div.field-name-field-difficulty").each do |level| 
      filler_name = level.text
      @@current_tags.each do |old|
        if filler_name.include? old
          filler_name.slice! old
          tags << old
        end
      end
    end
    @@new_tags << filler_name

    @doc.css("div.field-name-field-description").each do |description| 
      @description = description.text
      filler_name = description.text.split.map(&:capitalize).join(' ').gsub(".", "").gsub(",", "").gsub(":", "").gsub("/", " ")
      @@current_tags.each do |old|
        if filler_name.include? old
          filler_name.slice! old
          tags << old unless tags.include? old 
        end
      end
    end 
    @@new_tags += filler_name.split(" ")
    tags
  end

  def price_search
    price = nil
    @doc.css("div.field-name-field-code-standard-price").each do |data| 
      data.css('td').each do |web_price|
        price = web_price.text
      end
    end 
    if price == nil
      @doc.css("div.field-name-field-code-printable-price").each do |data| 
        data.css('td').each do |web_price|
          price = web_price.text
          @online_only = true
        end
      end 
    end
    if @out_of_print == true && price == nil
      return price
    end
    price.slice! "$"
    price.to_f
  end


  def out_of_print_search?
    if @doc.css("div.field-name-field-status").text == "Out-of-Print"
      @name += "*"
      return true
    end
    return false
  end

  def other_search
    @doc.css("div.fieldset-wrapper").each do |data|
      data.css("div.field-name-field-fabrics").each do |fabrics|
        p fabrics.text
        p "-------------------"
      end
      data.css("div.field-name-field-notions").each do |notions|
        p notions.text
        p "-------------------"
      end
      data.css("div.field-name-field-combinations").each do |combinations|
        p combinations.text
        p "-------------------"
      end
      data.css("div.field-name-field-yardage tr").each do |yardage|
        p "============="
        yardage.css("td").each do |info|
          p info.text

        end
      end
      p "-------------------"
    end 
  end

  def add_tags_to_database
    @current_tags.each do |tag|
      tag = Tag.find_by(name: tag)
      unless tag.save
        puts tag.errors.full_messages
      end
    end
  end

  def send_to_database
    p @name
    pattern = Pattern.find_or_create_by(name: @pattern_number) do |new_pattern|
      new_pattern.url = @url
      new_pattern.price = @price,
      new_pattern.out_of_print = @out_of_print,
      new_pattern.display_name = @display_name.titleize,
      new_pattern.description = @description
      new_pattern.online_only = @online_only
    end
    # if @name[-1] == "*" && Pattern.find_by(name: @name) 
    # check url
    #   if @name[-3]  == "*"
    #     @name = @pattern_number += "#"
    #   else
    #     @name += "*"
    #   end
    # end
    unless pattern.save
      p "_______"
      p pattern.id
      p pattern.name
      p pattern.errors.full_messages
      p "_______"
    end
    plurals = ["Dress", "Skirt", "Pant", "Short", "Jumpsuit", "Top", "Coat", "Jacket", "Vest", "Doll"]
p 1 
    @tags.each do |tag|
      tag = "Misses'" if tag == "Misses"
      tag = "Dresses" if tag == "Dress"
      tag = "Loose Fitting" if tag == "Loose-fitting"
      tag = "V-Neck" if tag == "V-neck"

      if plurals.include? tag
        tag += "s"
      end
      p tag
      insert_tag = Tag.find_by(name: tag)
      pattern_tag = PatternTag.find_or_create_by(tag_id: insert_tag.id, pattern_id: pattern.id)

      unless pattern_tag.save
        p "========"
        p pattern.id
        p insert_tag.id
        p pattern_tag.errors.full_messages
        p "========"
      end
    end

    pattern.name = @name
    pattern.price = @price
    pattern.out_of_print = @out_of_print
    pattern.display_name = @display_name.titleize
    pattern.description = @description
    pattern.online_only = @online_only

    unless pattern.save
      p "......."
      p pattern.id
      p pattern.name
      p pattern.errors.full_messages
      p "......."
    end
p 2
    image = Image.find_or_create_by(pattern_id: pattern.id, url: @line_art, line_art: true)
    unless image.save
      p "========"
      p image.id
      p @line_art
      p image.errors.full_messages
      p "========"
    end
    @images.each do |image_url|
      # file = HTTP.get(image_url)
      image = Image.find_or_create_by(pattern_id: pattern.id, url: image_url, line_art: false)
      # image.file = HTTP.get(image_url)
      # image.file = file
      # image.update(file: file)
      # image.update(file: HTTP.get(image_url))

      unless image.save
        p "========"
        p image.id
        p image_url
        p image.errors.full_messages
        p "========"
      end
    end
  p 3 
  end
end











# class TagCheck
#   def initialize
#     @ignore_words = ["/ ", "Sewing Rating: ", "  ", "A", "C", "B", "D", "Purchased", "And", "Has", "Semi-fitted", "With", ".", ",", "For", "At", "Is", "E", " , ", "Woman", "Size Xs S M L", "F", "G," "H", "I", "J", "K", "  and Sash"]
#   end

#   def new_tags_check(new_tags)
#     # new_tags = new_tags.uniq.join(' ').gsub("  ", " ").split(" ")
#     p "{{{{{{{{}}}}}}}}}"
#     p new_tags
#     @@ignore_words.each do |check|
#       if new_tags.include? check
#         # new_tags = new_tags.gsub(check, "")
#         p check
#         p new_tags
#         p new_tags -= [check]
#       end
#     end
#     new_tags = new_tags.uniq.join(' ').gsub("  ", " ")
#     @@ignore_words.each do |check|
#       if new_tags.include? check
#         new_tags.slice! check
#       end
#     end
#     new_tags
#   end
# end