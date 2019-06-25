

namespace :get_pattern_info_from_web do

  desc "BrandPageMccalls"
  task :send_to_database  => :environment do
    Dir.glob("#{Rails.root}/app/models/BrandPageMccalls.rb", ).each { |file| require file }
    Dir.glob("#{Rails.root}/app/models/PatternsPageMccalls.rb").each { |file| require file }
    mccall_brands = ["mccallpattern", "butterick", "voguepatterns"]
    #indie 
    mccall_search = ["plus-sizes", "misses", "accessories", "aprons", "kids", "family-sleepwear", "swimwear", "costumes", "uniforms", "men", "crafts-dolls-pets", "home-decorating", "out-of-print"]
    mccall_brands.each do |brand|
      mccall_search.each do |search|
        pattern = BrandPageMccalls.new(brand, search)
      end
    end
  end

end
