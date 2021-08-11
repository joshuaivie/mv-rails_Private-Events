class AddFeildToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :fullname, :string
    add_column :users, :username, :string, :limit => 25, :after => "email"
    add_index :users, :username, :unique => true
  end
end
