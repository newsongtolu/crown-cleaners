class AddOrganizationToEnquiries < ActiveRecord::Migration[8.1]
  def change
    add_column :enquiries, :organization, :string
  end
end
