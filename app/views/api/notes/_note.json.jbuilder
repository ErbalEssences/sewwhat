json.id note.id
json.pattern_id note.pattern_id
json.user_id note.user_id
json.username note.user.username
json.avatar rails_blob_url(note.user.avatar) if note.user.avatar.attachment

json.body note.body
json.public note.public
json.image note.pattern.images.first_only.url
json.pattern_name note.pattern.name
