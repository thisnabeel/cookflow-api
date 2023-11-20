class CreateRecipeSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_steps do |t|
      t.integer :recipe_step_id
      t.string :title
      t.text :body
      t.integer :position

      t.timestamps
    end
  end
end
