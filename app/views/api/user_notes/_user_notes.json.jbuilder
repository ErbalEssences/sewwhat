  json.id recipe.id
  json.title recipe.title
  
  json.chef recipe.user.name

  json.prep_time recipe.prep_time
  json.ingredients recipe.ingredients
  json.directions recipe.directions
  json.image_url recipe.image_url
  json.created_at recipe.friendly_created_at

  json.formatted do
    json.prep_time recipe.friendly_prep_time
    json.ingredients recipe.ingredients_list
    json.directions recipe.directions_list    
  end