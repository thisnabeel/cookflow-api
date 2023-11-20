json.extract! recipe_step, :id, :recipe_step_id, :title, :body, :position, :created_at, :updated_at
json.url recipe_step_url(recipe_step, format: :json)
