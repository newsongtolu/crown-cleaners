class CreateTestimonials < ActiveRecord::Migration[8.1]
  def change
    create_table :testimonials do |t|
      t.text :quote
      t.string :author_title
      t.string :company_or_location
      t.integer :rating
      t.integer :position
      t.boolean :active

      t.timestamps
    end
  end
end
