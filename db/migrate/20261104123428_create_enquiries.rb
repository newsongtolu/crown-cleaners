class CreateEnquiries < ActiveRecord::Migration[8.1]
  def change
    create_table :enquiries do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :service_type
      t.text :message
      t.string :status

      t.timestamps
    end
  end
end
