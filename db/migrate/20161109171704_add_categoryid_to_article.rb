class AddCategoryidToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :categoryid, :integer
  end
end
