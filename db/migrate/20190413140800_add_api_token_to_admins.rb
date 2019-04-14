class AddApiTokenToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :api_token, :string
    add_index :admins, :api_token, unique: true
  end
end
