class Article < ApplicationRecord
  belongs_to :category
  validates_presence_of [:body, :title, :readcount]
  ratyrate_rateable "rating"
end
