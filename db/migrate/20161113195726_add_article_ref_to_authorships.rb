class AddArticleRefToAuthorships < ActiveRecord::Migration[5.0]
  def change
    add_reference :authorships, :article, foreign_key: true
  end
end
