class Author < ApplicationRecord
  mount_uploader :photo, PhotoUploader

	has_many :authorships
	has_many :articles, through: :authorships

	def to_s
    "#{firstname} #{lastname}"
  end
end
