class AddApiTokenToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :api_token, :string
    add_index :students, :api_token, unique: true
  end
end
