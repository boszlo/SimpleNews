class Article < ApplicationRecord
  belongs_to :category
  validates_presence_of :body
end
