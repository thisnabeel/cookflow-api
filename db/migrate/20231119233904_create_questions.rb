class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :questionable_type
      t.integer :questionable_id
      t.text :body
      t.text :answer

      t.timestamps
    end
  end
end
