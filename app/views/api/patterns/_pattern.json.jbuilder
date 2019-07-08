json.count @count
json.numbers @numbers

json.id pattern.id
json.name pattern.name
json.url pattern.url
json.original_price pattern.price
json.price number_to_currency(pattern.price)
json.out_of_print pattern.out_of_print
json.display_name pattern.display_name.titleize
json.description pattern.description

json.brand pattern.tags.Brand if pattern.tags.Brand 
# json.main pattern.tags.Main if pattern.tags.Main
# json.subcategory pattern.tags.Subcategory if pattern.tags.Subcategory
json.designers pattern.tags.Designer if pattern.tags.Designer
# json.collections pattern.tags.Details if pattern.tags.Details
json.difficulty pattern.tags.Difficulty if pattern.tags.Difficulty



tags_list = []
pattern.tags.Brand.each do |tag|
  tags_list << tag.name
end
pattern.tags.Subcategory.each do |tag|
  tags_list << tag.name
end
pattern.tags.Details.each do |tag|
  tags_list << tag.name
end

json.tags tags_list.join(", ")


json.images do
  json.line_art do
    json.partial! pattern.images_line_art_only, partial: 'api/image', as: :image
  end

  json.main_images do
    json.array! pattern.images_main_only, partial: 'api/images/image', as: :image
  end
  json.user_images do
    json.array! pattern.images_user_only, partial: 'api/images/image', as: :image
  end
end

# json.tags do
#   json.array! pattern.tags, partial: 'api/tags/tag', as: :tag
# end

json.private_notes do
  json.array! pattern.notes.private_only, partial: 'api/notes/note', as: :note
end

json.public_notes do
  json.array! pattern.notes.public_only, partial: 'api/notes/note', as: :note
end