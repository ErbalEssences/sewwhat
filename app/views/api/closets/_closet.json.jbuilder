json.id closet.id
json.name closet.name
json.user_id closet.user_id
json.username closet.user.username

@patterns = closet.patterns

json.closet_patterns do
  json.array! closet.closet_patterns, partial: 'api/closet_patterns/closet_pattern', as: :closet_pattern
end
 

json.patterns do
  json.array! @patterns, partial: 'api/patterns/pattern', as: :pattern
end