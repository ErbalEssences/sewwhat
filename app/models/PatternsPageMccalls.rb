require 'nokogiri'
require 'open-uri'


class PatternsPageMccalls
  attr_reader :title_hash, :link_hash, :images, :line_art, :name, :display_name, :description, :url
  @@current_tags = Tags.all
  # @@current_tags = [ 
  #     "Very Easy",
  #     "Cardigan",
  #     "Shawl",
  #     "Kimono",
  #     "Jacket",
  #     "Skirt",
  #     "V-neck",
  #     "Shirt",
  #     "Top",
  #     "Invisible Zipper",
  #     "Skirt",
  #     "Children's",
  #     "Floor-length Train",
  #     "Blouse",
  #     "Vest",
  #     "Jumpsuit",
  #     "Pleated Sash",
  #     "Corset-style Lacing",
  #     "Corset",
  #     "Fit and Flare",
  #     "Wrist-length",
  #     "Romper",
  #     "Elastic-Waist",
  #     "Flutter Sleeve",
  #     "Nightgown",
  #     "Overalls",
  #     "Open-Back",
  #     "Pillbox",
  #     "Beret",
  #     "Oversized Bow",
  #     "Bow",
  #     "Sun Hats",
  #     "Gloves",
  #     "Belt",
  #     "Petite",
  #     "Crew-Neck",
  #     "Capris",
  #     "Sleeveless",
  #     "Twist-Front",
  #     "Detachable Sleeves",
  #     "No Seams",
  #     "High-Low",
  #     "Gathered-Bust",
  #     "Tiered",
  #     "Shaped",
  #     "Dropped-waist",
  #     "Raglan Sleeve",
  #     "Yoke-Detail",
  #     "Halter",
  #     "One-Piece",
  #     "Tunic",
  #     "Tank",
  #     "Stand-Up Collar",
  #     "Dolman Sleeves",
  #     "Gathered-Front",
  #     "Keyhole",
  #     "Princess Seams",
  #     "Wrong Side Of Fabric Will Show",
  #     "V-Neck",
  #     "Loose-fitting",
  #     "Bust Pocket",
  #     "Mandarin Collar",
  #     "Midriff",
  #     "Coat",
  #     "Empire-Waist",
  #     "Sweetheart-Neckline",
  #     "Doll",
  #     "Stretch Knits Only",
  #     "Side Zipper",
  #     "Average",
  #     "Side Seam", 
  #     "Slit",
  #     "Flounce",
  #     "Wrap",
  #     "Women's",
  #     "Evening",
  #     "Bridal",
  #     "Retro",
  #     "Suits",
  #     "Coordinates",
  #     "Jackets",
  #     "Vests",
  #     "Coats",
  #     "Capes",
  #     "Tops",
  #     "Skirts",
  #     "Jumpsuits",
  #     "Maternity",
  #     "All Misses",
  #     "Plus Sizes",
  #     "Accessories",
  #     "Aprons",
  #     "Kids",
  #     "Family Sleepwear",
  #     "Swimwear",
  #     "Costumes",
  #     "Uniforms",
  #     "Men",
  #     "Crafts",
  #     "Dolls",
  #     "Pets",
  #     "Home Decorating",
  #     "Indie",
  #     "Butterick",
  #     "Misses'",
  #     "Fitted",
  #     "Back Opening",
  #     "Tie Closures",
  #     "Dress",
  #     "Asymmetrical Hem",
  #     "Flared Skirt",
  #     "Tie Closures",
  #     "Elasticized Back",
  #     "Easy",
  #     "Ruffle",
  #     "Exposed-Dart",
  #     "Oversized",
  #     "Mock-neck",
  #     "Two-way Stretch Knits Onlys",
  #     "Gathered-Yoke",
  #     "Mock-pockets",
  #     "Leggings",
  #     "Asymmetrical-Zip",
  #     "A-Line",
  #     "Cowl-Neck",
  #     "Bias",
  #     "circa 1941",
  #     "Mock-sleeve",
  #     "Vogue",
  #     "Special Occasion",
  #     "High Collar",
  #     "Pleat",
  #     "Back Zipper",
  #     "Fully Lined",
  #     "Mccall's",
  #     "Shorts",
  #     "Pants",
  #     "Flared",
  #     "Front Zipper",
  #     "Pockets",
  #     "Semi-fitted",
  #     "Loose Fitting",
  #     "Button Front",
  #     "Elasticized Waist",
  #     "Notched Collar",
  #     "Slit",
  #     "Bodice",
  #     "Shaped Hem",
  #     "Hood",
  #     "Elasticized Leg",
  #     "Pullover",
  #     "Kimono Sleeve",
  #     "Elastic Waist",
  #     "Bodice Underlay",
  #     "Inner Casing",
  #     "Advanced",
  #     "Girls",
  #     "High Low",
  #     "Raised Waist",
  #     "Lined",
  #     "Petticoat",
  #     "Sleeveless",
  #     "Peter Pan Collar",
  #     "Lining Shows",
  #     "Tiers",
  #     "Gown",
  #     "Veil",
  #     "Zipper",
  #     "Maxi",
  #     "Collar With Drawstring",
  #     "Mock-back",
  #     "Flutter Sleeves" ]
  @@new_tags = []
  

  def initialize(brand, pattern_number)
    @url = "https://#{brand}.mccall.com/#{pattern_number}"
    p @@current_tags 
    @title_hash = {}
    @link_hash = {}
    @doc = fetch!
    @images = images_search
    @line_art = line_art_search
    @name = pattern_number
    @display_name = display_name_search 
    @description = ""
    p @tags = tag_search
    puts "........."
    p @@new_tags
    puts "........."
    p @description
    puts "_____"
    @@new_tags = []
    @display_name.titleize
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
    filler_name = ""
    @@current_tags. each do |old|
      filler_name = @display_name
      filler_name.slice! "/ "
      if filler_name.include? old
        filler_name.slice! old
        tags << old
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

  def send_to_database
    pattern = Pattern.new(
                            name: @name,
                            url: @url,
                            price: params[:price],
                            out_of_print: params[:out_of_print],
                            display_name: @display_name.titleize
                          )
    if pattern.save
      render 'show.json.jbuilder'
    else
      puts pattern.errors.full_messages
    end
  end
end



class TagCheck
  def initialize
    @ignore_words = ["/ ", "Sewing Rating: ", "  ", "A", "C", "B", "D", "Purchased", "And", "Has", "Semi-fitted", "With", ".", ",", "For", "At", "Is", "E", " , ", "Woman", "Size Xs S M L", "F", "G," "H", "I", "J", "K", "  and Sash"]
  end

  def new_tags_check(new_tags)
    # new_tags = new_tags.uniq.join(' ').gsub("  ", " ").split(" ")
    p "{{{{{{{{}}}}}}}}}"
    p new_tags
    @@ignore_words.each do |check|
      if new_tags.include? check
        # new_tags = new_tags.gsub(check, "")
        p check
        p new_tags
        p new_tags -= [check]
      end
    end
    new_tags = new_tags.uniq.join(' ').gsub("  ", " ")
    @@ignore_words.each do |check|
      if new_tags.include? check
        new_tags.slice! check
      end
    end
    new_tags
  end
end