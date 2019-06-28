json.id closet.id
json.name closet.name
json.user_id closet.user_id
json.username closet.user.username

@patterns = closet.patterns

json.cp closet.closet_patterns

json.patterns do
  json.array! @patterns, partial: 'api/patterns/pattern', as: :pattern
end