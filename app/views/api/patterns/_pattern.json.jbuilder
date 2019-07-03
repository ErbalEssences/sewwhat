json.id pattern.id
json.name pattern.name
json.url pattern.url
json.original_price pattern.price
json.price number_to_currency(pattern.price)
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

json.private_notes do
  json.array! pattern.notes.private_only, partial: 'api/notes/note', as: :note
end

json.public_notes do
  json.array! pattern.notes.public_only, partial: 'api/notes/note', as: :note
end