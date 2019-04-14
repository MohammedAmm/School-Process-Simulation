class AddApiTokenToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :api_token, :string
    add_index :teachers, :api_token, unique: true
  end
end
