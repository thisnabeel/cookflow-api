json.extract! recipe, :id, :recipe_id, :title, :body, :header, :position, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
