require 'elasticsearch/model'
class Author < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  mount_uploader :photo, PhotoUploader

	has_many :authorships
	has_many :articles, through: :authorships

  # for elasticsearch - boost title by 10 points in search results
  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['firstname', 'lastname', 'bio']
          }
        },
        highlight: {
          pre_tags: ['<em>'],
          post_tags: ['</em>'],
          fields: {
            firstname: {},
            lastname: {},
            bio: {}
          }
        }       
      }
    )
  end

	def to_s
    "#{firstname} #{lastname}"
  end
end

# Delete the previous articles index in Elasticsearch
Author.__elasticsearch__.client.indices.delete index: Author.index_name rescue nil

# Create the new index with the new mapping
Author.__elasticsearch__.client.indices.create \
  index: Author.index_name,
  body: { settings: Author.settings.to_hash, mappings: Author.mappings.to_hash }

Author.import force: true # for auto sync model with elastic search
