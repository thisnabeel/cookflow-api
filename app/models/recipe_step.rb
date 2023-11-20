class RecipeStep < ApplicationRecord
    belongs_to :recipe
    belongs_to :recipe_step, optional: true
end
