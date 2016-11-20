# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


(0..15).each do |index|
  Author.create( firstname: Forgery('name').first_name, lastname: Forgery('name').last_name, bio: Forgery('lorem_ipsum').paragraph )
end

Category.create(category_name: "News")
Category.create(category_name: "Features")

(0..15).each do |index|
  featured = index.odd? ? true : false
  category_id = index.odd? ? 1 : 2
  Article.create(title: Forgery('lorem_ipsum').title, body: Forgery('lorem_ipsum').paragraphs, featured: featured, readcount: 0, rating: 0, category_id: category_id)
end


# for each article find unique image
photos = Dir.glob('app/assets/images/seed-images/*.jpg').compact

Article.all.each do |article|
    random = Random.new.rand(0...photos.size)
    jpg = photos[random]
    article.photo = File.open(jpg) 
    article.save!
end

# add authors
Article.all.each_with_index do |article, index|
  index += 1
  article.authors << Author.find(index)
end

# add second author to first article
Article.first.authors << Author.last

puts "Seed planted!"


