json.id closet_pattern.id

json.pattern_id closet_pattern.pattern_id
json.closet_id closet_pattern.closet_id

json.pattern_id closet_pattern.pattern.id
json.pattern_name closet_pattern.pattern.name
json.pattern_display_name closet_pattern.pattern.display_name

json.images do
  json.array! closet_pattern.pattern.images_main_only, partial: 'api/images/image', as: :image
end

json.closet closet_pattern.closet.name
json.user_id closet_pattern.closet.user_id
json.user closet_pattern.closet.user.username
