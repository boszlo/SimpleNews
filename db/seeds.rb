# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


(0..15).each do |index|
  Author.create( firstname: Forgery('name').first_name, lastname: Forgery('name').last_name, bio: Forgery('lorem_ipsum').paragraphs(5) )
end

Category.create(category_name: "News")
Category.create(category_name: "Features")

(0..15).each do |index|
  featured = index.odd? ? true : false
  category_id = index.odd? ? 1 : 2
  title = "Article number #{index.to_words}"
  body = "<p>#{Forgery('lorem_ipsum').paragraphs(20)}</p>" * 10
  Article.create(title: title, body: body, featured: featured, readcount: 0, rating: 0, category_id: category_id)
end


# for each article find unique image
photos = Dir.glob('app/assets/images/seed-images/*.jpg').compact
counter = 0

Article.all.each do |article|
  #random = Random.new.rand(0...photos.size)
  #jpg = photos[random]
  counter = counter < photos.size ? counter : 0
  jpg = photos[counter]
  article.photo = File.open(jpg) 
  article.save!
  counter += 1
end

# add 2 authors to each article
Article.all.each_with_index do |article, index|
  index += 1
  article.authors << Author.find(index)
  article.authors << Author.all[-index]
end


puts "Seed planted!"


