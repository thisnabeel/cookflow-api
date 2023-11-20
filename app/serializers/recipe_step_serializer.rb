class RecipeStepSerializer < ActiveModel::Serializer
  attributes :id, :recipe_step_id, :recipe_id, :title, :body, :position
end
