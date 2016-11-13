class Article < ApplicationRecord
  belongs_to :category
  has_many :authorships
  has_many :authors, through: :authorships
  validates_presence_of [:body, :title, :readcount]
  ratyrate_rateable "rating"
end
