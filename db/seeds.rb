current_tags = [ 
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
      "Children's",
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
current_tags.each do |tag|
  tag = Tag.find_or_create_by(name: tag)
  if tag.save
  else
    puts tag.errors.full_messages
  end
end

# maggie = User.create(username: 'Margaret', email: "margaret@gmail.com", skill: 2, avatar_url: "https://www.petbarn.com.au/petspot/app/uploads/2019/01/iStock_000012210170Medium-labrador-puppy-dog-chew-2.jpg", admin: false)
# sabrina = User.create(username: 'Sabrina', email: "sabrina@gmail.com", skill: 0, avatar_url: "https://s2.r29static.com//bin/entry/560/720x864,85/2199306/this-poor-girl-had-more-2199306.webp", admin: false)
# liese = User.create(username: 'Liese', email: "liese@gmail.com", skill: 1, avatar_url: "https://cdn.pixabay.com/photo/2015/10/01/20/28/animal-967657_960_720.jpg", admin: true)

# butterick_1 = Pattern.create(name: "B6675", display_name: "Misses'/Women's Dress", url: "https://butterick.mccall.com/b6675", price: 11.97, out_of_print: false)
# vogue_1 = Pattern.create(name: "V9373", display_name: "Misses' Special Occasion Dress", url: "https://voguepatterns.mccall.com/v9373", price: 6.99, out_of_print: false)
# mccall_1 = Pattern.create(name: "M7961", display_name: "Misses' Shorts and Pants", url: "https://mccallpattern.mccall.com/m7961", price: 11.97, out_of_print: false)
# butterick_2 = Pattern.create(name: "B6306", display_name: "Children's/Girls' High-Low or Tiered Dress" , url: "https://butterick.mccall.com/b6306", price: 2.99, out_of_print: false)
# vogue_2 = Pattern.create(name: "V1627", display_name: "MISSES' SPECIAL OCCASION DRESS AND SASH".titleize, url: "https://voguepatterns.mccall.com/v1627", price: 6.99, out_of_print: false)
# mccall_2 = Pattern.create(name: "M7880", display_name: "Misses'/Children's/Girls' Tops and Pants", url: "https://mccallpattern.mccall.com/m7880", price: 13.17, out_of_print: false)

# easy = Tag.create(name: "Easy")
# evening = Tag.create(name: "Evening")
# bridal = Tag.create(name: "Bridal")
# retro = Tag.create(name: "Retro")
# suits = Tag.create(name: "Suits") 
# coordinates = Tag.create(name: "Coordinates")
# jackets = Tag.create(name: "Jackets")
# vests = Tag.create(name: "Vests")
# coats = Tag.create(name: "Coats")
# capes = Tag.create(name: "Capes")
# tops = Tag.create(name: "Tops")
# skirts = Tag.create(name: "Skirts")
# jumpsuits = Tag.create(name: "Jumpsuits")
# maternity = Tag.create(name: "Maternity")
# misses = Tag.create(name: "All Misses")
# plus_sizes = Tag.create(name: "Plus Sizes")
# accessories = Tag.create(name: "Accessories")
# aprons = Tag.create(name: "Aprons")
# kids = Tag.create(name: "Kids")
# family_sleepwear = Tag.create(name: "Family Sleepwear")
# swimwear = Tag.create(name: "Swimwear")
# costumes = Tag.create(name: "Costumes")
# uniforms = Tag.create(name: "Uniforms")
# men = Tag.create(name: "Men")
# crafts = Tag.create(name: "Crafts")
# dolls = Tag.create(name: "Dolls")
# pets = Tag.create(name: "Pets")
# home_decorating = Tag.create(name: "Home Decorating")
# indie = Tag.create(name: "Indie")
# butterick = Tag.create(name: "Butterick")
# misses = Tag.create(name: "Misses'")
# dress = Tag.create(name: "Dress")
# asymmetrical_hem = Tag.create(name: "Asymmetrical Hem")
# flared_skirt = Tag.create(name: "Flared Skirt")
# semi_fitted = Tag.create(name: "Semi-Fitted")
# tie_closures = Tag.create(name: "Tie Closures")
# very_easy = Tag.create(name: "Very Easy")
# vogue = Tag.create(name: "Vogue")
# special_occasion = Tag.create(name: "Special Occasion")
# high_collar = Tag.create(name: "High Collar")
# pleat = Tag.create(name: "Pleat")
# back_zipper = Tag.create(name: "Back Zipper")
# fully_lined = Tag.create(name: "Fully Lined")
# mccall = Tag.create(name: "Mccall's")
# shorts = Tag.create(name: "Shorts")
# pants = Tag.create(name: "Pants")
# pleat = Tag.create(name: "Pleat")
# flared = Tag.create(name: "Flared")
# front_zipper = Tag.create(name: "Front Zipper")
# pockets = Tag.create(name: "Pockets")
# loose_fitting = Tag.create(name: "loose fitting")
# button_front = Tag.create(name: "button front")
# elasticized_waist = Tag.create(name: "elasticized waist")
# notched_collar = Tag.create(name: "notched collar")
# shaped_hem = Tag.create(name: "shaped_hem")
# hood = Tag.create(name: "hood")
# elasticized_leg = Tag.create(name: "elasticized leg")
# pullover = Tag.create(name:"pullover")
# loose_fitting = Tag.create(name:"loose fitting")
# kimono_sleeve = Tag.create(name:"kimono sleeve")
# elastic_waist = Tag.create(name:"elastic waist")
# bodice_underlay = Tag.create(name:"bodice underlay")
# inner_casing = Tag.create(name:"inner casing")
# advanced = Tag.create(name:"advanced")
# girls = Tag.create(name:"girls")
# high_low = Tag.create(name: "high low")
# raised_waist = Tag.create(name: "raised waist")
# back_zipper = Tag.create(name: "back zipper")
# lined = Tag.create(name: "lined")
# petticoat = Tag.create(name: "petticoat") 
# sleeveless = Tag.create(name: "sleeveless")
# peter_pan_collar = Tag.create(name: "peter pan collar")
# lining_shows = Tag.create(name: "lining shows")
# tiers = Tag.create(name: "tiers")
# flutter_sleeves = Tag.create(name: "flutter sleeves")

# PatternTag.create(tag_id: kids.id, pattern_id: butterick_2)
# PatternTag.create(tag_id: girls.id, pattern_id: butterick_2)
# PatternTag.create(tag_id: high_low.id, pattern_id: butterick_2)
# PatternTag.create(tag_id: easy.id, pattern_id: butterick_2)
# PatternTag.create(tag_id: dress.id, pattern_id: butterick_2) 
# PatternTag.create(tag_id: raised_waist.id, pattern_id: butterick_2)
# PatternTag.create(tag_id: back_zipper.id, pattern_id: butterick_2)
# PatternTag.create(tag_id: lined.id, pattern_id: butterick_2)
# PatternTag.create(tag_id: petticoat.id, pattern_id: butterick_2)
# PatternTag.create(tag_id: sleeveless.id, pattern_id: butterick_2)
# PatternTag.create(tag_id: peter_pan_collar.id, pattern_id: butterick_2)
# PatternTag.create(tag_id: lining_shows.id, pattern_id: butterick_2)
# PatternTag.create(tag_id: tiers.id, pattern_id: butterick_2)
# PatternTag.create(tag_id: flutter_sleeves.id, pattern_id: butterick_2)
# PatternTag.create(tag_id: advanced.id, pattern_id: vogue_2)
# PatternTag.create(tag_id: special_occasion.id, pattern_id: vogue_2)
# PatternTag.create(tag_id: pullover.id, pattern_id: vogue_2)
# PatternTag.create(tag_id: dress.id, pattern_id: vogue_2)
# PatternTag.create(tag_id: loose_fitting.id, pattern_id: vogue_2)
# PatternTag.create(tag_id: kimono_sleeve.id, pattern_id: vogue_2)
# PatternTag.create(tag_id: elastic_waist.id, pattern_id: vogue_2)
# PatternTag.create(tag_id: bodice_underlay.id, pattern_id: vogue_2)
# PatternTag.create(tag_id: inner_casing.id, pattern_id: vogue_2)
# PatternTag.create(tag_id: easy.id, pattern_id: butterick_1.id)
# PatternTag.create(tag_id: butterick.id, pattern_id: butterick_1.id)
# PatternTag.create(tag_id: misses.id, pattern_id: butterick_1.id)
# PatternTag.create(tag_id: dress.id, pattern_id: butterick_1.id)
# PatternTag.create(tag_id: asymmetrical_hem.id, pattern_id: butterick_1.id)
# PatternTag.create(tag_id: flared_skirt.id, pattern_id: butterick_1.id)
# PatternTag.create(tag_id: semi_fitted.id, pattern_id: butterick_1.id)
# PatternTag.create(tag_id: tie_closures.id, pattern_id: butterick_1.id)
# PatternTag.create(tag_id: very_easy.id, pattern_id: vogue_1.id)
# PatternTag.create(tag_id: vogue.id, pattern_id: vogue_1.id)
# PatternTag.create(tag_id: misses.id, pattern_id: vogue_1.id)
# PatternTag.create(tag_id: dress.id, pattern_id: vogue_1.id)
# PatternTag.create(tag_id: special_occasion.id, pattern_id: vogue_1.id)
# PatternTag.create(tag_id: high_collar.id, pattern_id: vogue_1.id)
# PatternTag.create(tag_id: back_zipper.id, pattern_id: vogue_1.id)
# PatternTag.create(tag_id: pleat.id, pattern_id: vogue_1.id)
# PatternTag.create(tag_id: fully_lined.id, pattern_id: vogue_1.id)
# PatternTag.create(tag_id: easy.id, pattern_id: mccall_1.id)
# PatternTag.create(tag_id: mccall.id, pattern_id: mccall_1.id)
# PatternTag.create(tag_id: misses.id, pattern_id: mccall_1.id)
# PatternTag.create(tag_id: shorts.id, pattern_id: mccall_1.id)
# PatternTag.create(tag_id: pants.id, pattern_id: mccall_1.id)
# PatternTag.create(tag_id: semi_fitted.id, pattern_id: mccall_1.id)
# PatternTag.create(tag_id: flared.id, pattern_id: mccall_1.id)
# PatternTag.create(tag_id: front_zipper.id, pattern_id: mccall_1.id)
# PatternTag.create(tag_id: pockets.id, pattern_id: mccall_1.id)
# PatternTag.create(tag_id: loose_fitting.id, pattern_id: mccall_2.id)
# PatternTag.create(tag_id: button_front.id, pattern_id: mccall_2.id)
# PatternTag.create(tag_id: pockets.id, pattern_id: mccall_2.id)
# PatternTag.create(tag_id: elasticized_waist.id, pattern_id: mccall_2.id) 
# PatternTag.create(tag_id: notched_collar.id, pattern_id: mccall_2.id)
# PatternTag.create(tag_id: shaped_hem.id, pattern_id: mccall_2.id)
# PatternTag.create(tag_id: hood.id, pattern_id: mccall_2.id)
# PatternTag.create(tag_id: elasticized_leg.id, pattern_id: mccall_2.id)
# PatternTag.create(tag_id: pants.id, pattern_id: mccall_2.id)
# PatternTag.create(tag_id: tops.id, pattern_id: mccall_2.id)
# PatternTag.create(tag_id: family_sleepwear.id, pattern_id: mccall_2.id)

# Image.create(pattern_id: butterick_1.id, url: "https://butterick.mccall.com/sites/default/files/products/b6675/B6675.gif", line_art: true)
# Image.create(pattern_id: butterick_1.id, url: "https://butterick.mccall.com/sites/default/files/styles/p_xl/public/products/b6675/B6675_01.jpg?itok=ObpUl923", line_art: false)
# Image.create(pattern_id: butterick_1.id, url: "https://butterick.mccall.com/sites/default/files/styles/p_l/public/products/b6675/B6675_02.jpg?itok=Jil8cDpV", line_art: false)
# Image.create(pattern_id: butterick_1.id, url: "https://butterick.mccall.com/sites/default/files/styles/p_l/public/products/b6675/B6675_03.jpg?itok=QSUhdN93", line_art: false)
# Image.create(pattern_id: butterick_1.id, url: "https://butterick.mccall.com/sites/default/files/styles/p_l/public/products/b6675/B6675_04.jpg?itok=CjpaLHR-", line_art: false)
# Image.create(pattern_id: vogue_1.id, url: "https://voguepatterns.mccall.com/sites/default/files/products/v9373/V9373.gif", line_art: true)
# Image.create(pattern_id: vogue_1.id, url: "https://voguepatterns.mccall.com/sites/default/files/styles/p_xl/public/products/v9373/V9373_01.jpg?itok=6vRuuMbE", line_art: false)
# Image.create(pattern_id: vogue_1.id, url: "https://voguepatterns.mccall.com/sites/default/files/styles/p_l/public/products/v9373/V9373_02.jpg?itok=xmqShktB", line_art: false)
# Image.create(pattern_id: vogue_1.id, url: "https://voguepatterns.mccall.com/sites/default/files/styles/p_l/public/products/v9373/V9373_03.jpg?itok=6LQ11R0-", line_art: false)
# Image.create(pattern_id: mccall_1.id, url: "https://mccallpattern.mccall.com/sites/default/files/products/m7961/M7961.gif", line_art: true)
# Image.create(pattern_id: mccall_1.id, url: "https://mccallpattern.mccall.com/sites/default/files/styles/p_xl/public/products/m7961/M7961_01.jpg?itok=7XifqMSv", line_art: false)
# Image.create(pattern_id: mccall_1.id, url: "https://mccallpattern.mccall.com/sites/default/files/styles/p_l/public/products/m7961/M7961_02.jpg?itok=4xmqo53k", line_art: false)
# Image.create(pattern_id: mccall_1.id, url: "https://mccallpattern.mccall.com/sites/default/files/styles/p_l/public/products/m7961/M7961_03.jpg?itok=yXmlmeHX", line_art: false)
# Image.create(pattern_id: mccall_1.id, url: "https://mccallpattern.mccall.com/sites/default/files/styles/p_xl/public/products/m7961/M7961_04.jpg?itok=Q-ooUTkT", line_art: false)
# Image.create(pattern_id: butterick_2.id, url: "https://butterick.mccall.com/sites/default/files/products/b6306/B6306.gif", line_art: true)
# Image.create(pattern_id: butterick_2.id, url: "https://butterick.mccall.com/sites/default/files/styles/p_xl/public/products/b6306/B6306_01.jpg?itok=VWUc7OSy", line_art: false)
# Image.create(pattern_id: butterick_2.id, url: "https://butterick.mccall.com/sites/default/files/styles/p_l/public/products/b6306/b6306-a.jpg?itok=Oj5ODmHs", line_art: false)
# Image.create(pattern_id: vogue_2.id, url: "https://voguepatterns.mccall.com/sites/default/files/products/v1627/V1627.gif", line_art: true)
# Image.create(pattern_id: vogue_2.id, url: "https://voguepatterns.mccall.com/sites/default/files/styles/p_xl/public/products/v1627/V1627_01.jpg?itok=JF0oRCVm", line_art: false)
# Image.create(pattern_id: vogue_2.id, url: "https://voguepatterns.mccall.com/sites/default/files/styles/p_xl/public/products/v1627/V1627_02.jpg?itok=kFHlvBIg", line_art: false)
# Image.create(pattern_id: vogue_2.id, url: "https://voguepatterns.mccall.com/sites/default/files/styles/p_l/public/products/v1627/V1627_03.jpg?itok=F0y6xeV8", line_art: false)
# Image.create(pattern_id: vogue_2.id, url: "https://voguepatterns.mccall.com/sites/default/files/styles/p_l/public/products/v1627/V1627_04.jpg?itok=igjIcY1i", line_art: false)
# Image.create(pattern_id: vogue_2.id, url: "https://voguepatterns.mccall.com/sites/default/files/styles/p_l/public/products/v1627/V1627_a.jpg?itok=SGqPWjOa", line_art: false)
# Image.create(pattern_id: mccall_2.id, url: "https://mccallpattern.mccall.com/sites/default/files/products/m7880/M7880.gif", line_art: true)
# Image.create(pattern_id: mccall_2.id, url: "https://mccallpattern.mccall.com/sites/default/files/styles/p_xl/public/products/m7880/M7880_01.jpg?itok=vMcJPe-m", line_art: false)
# Image.create(pattern_id: mccall_2.id, url: "https://mccallpattern.mccall.com/sites/default/files/styles/p_l/public/products/m7880/M7880_03.jpg?itok=PAQ6FBtY", line_art: false)
# Image.create(pattern_id: mccall_2.id, url: "https://mccallpattern.mccall.com/sites/default/files/styles/p_xl/public/products/m7880/M7880_03.jpg?itok=UtuaVRYl", line_art: false)
# Image.create(pattern_id: mccall_2.id, url: "https://mccallpattern.mccall.com/sites/default/files/styles/p_xl/public/products/m7880/M7880_04.jpg?itok=upJV-OnL", line_art: false)
# Image.create(pattern_id: mccall_2.id, url: "https://mccallpattern.mccall.com/sites/default/files/styles/p_l/public/products/m7880/M7880_05.jpg?itok=jTx9zswb", line_art: false)
# Image.create(pattern_id: mccall_2.id, url: "https://mccallpattern.mccall.com/sites/default/files/styles/p_xl/public/products/m7880/M7880_06.jpg?itok=O5ceG35J", line_art: false)
# Image.create(pattern_id: mccall_2.id, url: "https://mccallpattern.mccall.com/sites/default/files/styles/p_xl/public/products/m7880/M7880_07.jpg?itok=aQjSkj98", line_art: false)
# Image.create(pattern_id: mccall_2.id, url: "https://mccallpattern.mccall.com/sites/default/files/styles/p_l/public/products/m7880/M7880_a.jpg?itok=-cxWLXco", line_art: false)

# Image.create(pattern_id: vogue_2.id, user_id: sabrina.id, url: "https://s2.r29static.com//bin/entry/560/720x864,85/2199306/this-poor-girl-had-more-2199306.webp", line_art: false)

# maggies = Closet.create(user_id: maggie.id, name: "Dresses")
# sabrinas_dresses = Closet.create(user_id: sabrina.id,name: "Dresses")
# sabrinas_family = Closet.create(user_id: sabrina.id,name: "Family")
# sabrinas_daughters = Closet.create(user_id: sabrina.id,name: "Daughters")

# ClosetPattern.create(closet_id: maggies.id, pattern_id: butterick_1)
# ClosetPattern.create(closet_id: maggies.id, pattern_id: vogue_1)
# ClosetPattern.create(closet_id: maggies.id, pattern_id: mccall_1)

# ClosetPattern.create(pattern_id: vogue_2)
# ClosetPattern.create(closet_id: sabrinas_family.id, pattern_id: mccall_2)
# ClosetPattern.create(closet_id: sabrinas_daughters.id, pattern_id: butterick_2)

# Note.create(user_id: maggie.id, pattern_id: butterick_1, public: true, body: "Don't use a stretch fabric, it causes pulling")
# Note.create(user_id: maggie.id, pattern_id: butterick_1, public: false, body: "Add 1 inch to sleeves")
