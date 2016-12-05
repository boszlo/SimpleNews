require 'elasticsearch/model'

class Article < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :category
  has_many :authorships
  has_many :authors, through: :authorships
  validates_presence_of [:body, :title, :readcount]
  ratyrate_rateable "rating"
  mount_uploader :photo, PhotoUploader

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :title, analyzer: 'english', index_options: 'offsets'
      indexes :body, analyzer: 'english'
    end
  end


  # for elasticsearch - boost title by 10 points in search results
  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title^10', 'body']
          }
        },
        highlight: {
          pre_tags: ['<em>'],
          post_tags: ['</em>'],
          fields: {
            title: {},
            body: {}
          }
        }       
      }
    )
  end
end

# Delete the previous articles index in Elasticsearch
Article.__elasticsearch__.client.indices.delete index: Article.index_name rescue nil

# Create the new index with the new mapping
Article.__elasticsearch__.client.indices.create \
  index: Article.index_name,
  body: { settings: Article.settings.to_hash, mappings: Article.mappings.to_hash }

Article.import force: true # for auto sync model with elastic search
