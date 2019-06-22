json.username user.username
json.email user.email
json.skill user.skill
json.avatar_url user.avatar_url

json.closets do
  json.array! user.closets, partial: 'api/closets/closet', as: :closet
end

json.notes do
  json.private do
    json.array! user.private_notes, partial: 'api/notes/note', as: :note
  end
  json.public do
    json.array! user.public_notes, partial: 'api/notes/note', as: :note
  end
end

