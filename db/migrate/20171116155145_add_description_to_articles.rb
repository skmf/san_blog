class AddDescriptionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :description, :text
    add_column :articles, :created_at, :date time
    add_column :articles, :updated_at, :date time
  end
end
