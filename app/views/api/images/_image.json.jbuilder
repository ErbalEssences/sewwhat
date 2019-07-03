json.id image.id
json.pattern_id image.pattern_id
json.pattern_name image.pattern.name
json.user_id image.user_id
json.url image.url

# json.file rails_blob_url(image.file) if image.file.attachment

if image.user
  json.username image.user.username 
  json.user_skill image.user.skill 
end

json.line_art image.line_art
