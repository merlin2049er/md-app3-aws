# frozen_string_literal: true

class AddProfileDetailsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :category_id, :integer
    add_column :users, :admin, :boolean
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :username, :string
    add_column :users, :address1, :string
    add_column :users, :address2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :postal, :string
    add_column :users, :provider, :string
    add_column :users, :image, :string
    add_column :users, :country, :string
  end
end
