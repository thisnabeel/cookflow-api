class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :title, :body, :header, :position
  attribute :steps, if: :include_steps?

  def include_steps?
    @instance_options[:steps]
  end

  def steps
    return object.recipe_steps.order("position ASC")
  end
end
