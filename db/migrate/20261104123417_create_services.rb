class CreateServices < ActiveRecord::Migration[8.1]
  def change
    create_table :services do |t|
      t.string :title
      t.string :slug
      t.text :description
      t.string :icon
      t.string :image_url
      t.integer :position
      t.boolean :active

      t.timestamps
    end
  end
end
