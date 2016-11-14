class Author < ApplicationRecord
	has_many :authorships
	has_many :articles, through: :authorships

	def to_s
      "#{firstname} #{lastname}"
    end
end
