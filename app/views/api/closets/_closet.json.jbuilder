json.name closet.name
json.user_id closet.user_id

@patterns = closet.patterns unless @patterns

json.patterns do
  json.array! @patterns, partial: 'api/patterns/pattern', as: :pattern
end