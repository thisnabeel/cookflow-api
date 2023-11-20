class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.integer :recipe_id
      t.string :title
      t.text :body
      t.boolean :header
      t.integer :position

      t.timestamps
    end
  end
end
