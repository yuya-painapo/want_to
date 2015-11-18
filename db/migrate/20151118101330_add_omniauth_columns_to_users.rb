class AddOmniauthColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string, null:false, default: ""
    add_column :users, :provider, :string, null:false, default: ""
    add_column :users, :name, :string
  end
end
