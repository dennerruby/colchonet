class RemovePasswordFromUsers < ActiveRecord::Migration[7.0]
  def up
    remove_column :users, :password
  end

  def down 
    add_collumn :users, :password, :string
  end
end
