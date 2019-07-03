json.brands do
  json.array! @tags.Brand, partial: 'api/tags/tag', as: :tag
end
json.main do
  json.array! @tags.Main, partial: 'api/tags/tag', as: :tag
end
json.subcategory do
  json.array! @tags.Subcategory, partial: 'api/tags/tag', as: :tag
end
json.designers do
  json.array! @tags.Designer, partial: 'api/tags/tag', as: :tag
end
json.collections do
  json.array! @tags.Collections, partial: 'api/tags/tag', as: :tag
end
json.details do
  json.array! @tags.Details, partial: 'api/tags/tag', as: :tag
end
json.difficulty do
  json.array! @tags.Difficulty, partial: 'api/tags/tag', as: :tag
end
