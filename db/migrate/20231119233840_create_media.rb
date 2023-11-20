class CreateMedia < ActiveRecord::Migration[7.0]
  def change
    create_table :media do |t|
      t.string :mediable_type
      t.integer :mediable_id
      t.string :media_url
      t.string :media_type
      t.text :description
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
