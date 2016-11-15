class AddPhotoToAuthors < ActiveRecord::Migration[5.0]
  def change
    add_column :authors, :photo, :string
  end
end
