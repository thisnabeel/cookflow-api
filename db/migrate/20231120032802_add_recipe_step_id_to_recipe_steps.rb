class AddRecipeStepIdToRecipeSteps < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_steps, :recipe_id, :integer
  end
end
