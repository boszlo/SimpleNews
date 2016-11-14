class AddAuthorRefToAuthorships < ActiveRecord::Migration[5.0]
  def change
    add_reference :authorships, :author, foreign_key: true
  end
end
