class AlterColumnsToUser < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :is_amdin, :boolean
  	add_column :users, :is_admin, :boolean
  end
end
