class AddSectorAndReplyPreferenceToEnquiries < ActiveRecord::Migration[8.1]
  def change
    add_column :enquiries, :sector, :string
    add_column :enquiries, :reply_preference, :string
  end
end
