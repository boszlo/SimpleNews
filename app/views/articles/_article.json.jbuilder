json.extract! article, :id, :title, :body, :featured, :readcount, :rating, :created_at, :updated_at
json.url article_url(article, format: :json)