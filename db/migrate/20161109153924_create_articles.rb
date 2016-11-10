class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.boolean :featured
      t.integer :readcount
      t.integer :rating

      t.timestamps
    end
  end
end
