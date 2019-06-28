json.id pattern.id
json.name pattern.name
json.url pattern.url
json.price pattern.price
json.out_of_print pattern.out_of_print
json.display_name pattern.display_name.titleize
json.description pattern.description



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

json.tags do
  json.array! pattern.tags, partial: 'api/tags/tag', as: :tag
end
