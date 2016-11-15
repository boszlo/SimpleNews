# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

authors_list = [
  [ "Maciej", "Deptula", "Chambray vice viral kombucha celiac, dreamcatcher cray. Yuccie viral health goth, lomo meditation leggings twee disrupt franzen portland everyday carry trust fund. Gentrify knausgaard before they sold out, whatever snackwave photo booth vice banjo venmo shoreditch you probably haven't heard of them hexagon meggings locavore VHS. Franzen single-origin coffee poutine hell of ennui. Sartorial hexagon vinyl, aesthetic cronut kale chips trust fund chia 90's cardigan la croix direct trade. Umami air plant master cleanse farm-to-table, live-edge whatever hella brunch cold-pressed. Aesthetic glossier wayfarers affogato swag subway tile, etsy four dollar toast." ],
  [ "Umberto", "Eco", "Artisan beard pabst, prism four dollar toast tote bag fam quinoa kinfolk messenger bag seitan intelligentsia. Copper mug jean shorts microdosing, tumeric gochujang chia umami yr chillwave blue bottle prism occupy. Bespoke skateboard gluten-free tbh, stumptown freegan raw denim keytar food truck beard copper mug ugh fingerstache. Celiac pinterest gastropub, pabst distillery four dollar toast pickled occupy edison bulb. Chicharrones kinfolk pug, woke glossier gochujang lo-fi affogato. Messenger bag hammock intelligentsia, cliche chicharrones banjo meggings. Knausgaard craft beer paleo, health goth shoreditch banh mi tbh prism dreamcatcher biodiesel narwhal freegan aesthetic." ],
  [ "Xavier", "Martinez", "Humblebrag heirloom photo booth, activated charcoal coloring book four loko biodiesel austin occupy distillery pickled roof party butcher bespoke. Four loko readymade 8-bit raclette occupy next level, swag sriracha mumblecore scenester snackwave squid lumbersexual truffaut. Food truck leggings cray, chia synth tbh vinyl jianbing. Hoodie man braid thundercats YOLO, pinterest tumblr yr dreamcatcher sustainable cold-pressed raw denim. DIY bushwick williamsburg, wayfarers truffaut live-edge locavore 90's copper mug woke kale chips godard gluten-free umami twee. Ramps etsy beard man braid keffiyeh austin. Tumblr everyday carry offal man bun." ],
  [ "Samantha", "Fox", "Health goth disrupt pabst before they sold out, four loko lomo typewriter kogi slow-carb YOLO chillwave ennui. Pickled neutra hot chicken ennui hammock, hell of irony locavore cray +1 vice sriracha gochujang sartorial. Echo park hella plaid raw denim everyday carry deep v mixtape. +1 tilde knausgaard cronut drinking vinegar, etsy vice shabby chic meh everyday carry. +1 locavore mustache franzen tote bag. Kogi wayfarers vexillologist pour-over, iceland pinterest VHS waistcoat poutine bushwick four dollar toast pabst mlkshk glossier before they sold out. Beard mixtape banh mi, pickled etsy gentrify four dollar toast retro deep v tumblr affogato." ]
]

authors_list.each do |firstname, lastname, bio|
  Author.create( firstname: firstname, lastname: lastname, bio: bio )
end

Category.create(category_name: "News")
Category.create(category_name: "Features")

article_list = [
  ["About life","Humblebrag heirloom photo booth, activated charcoal coloring book four loko biodiesel austin occupy distillery pickled roof party butcher bespoke. Four loko readymade 8-bit raclette occupy next level, swag sriracha mumblecore scenester snackwave squid lumbersexual truffaut. Food truck leggings cray, chia synth tbh vinyl jianbing. Hoodie man braid thundercats YOLO, pinterest tumblr yr dreamcatcher sustainable cold-pressed raw denim. DIY bushwick williamsburg, wayfarers truffaut live-edge locavore 90's copper mug woke kale chips godard gluten-free umami twee. Ramps etsy beard man braid keffiyeh austin. Tumblr everyday carry offal man bun.",true,0,0,1],
  ["Thoughts on procrastation","Humblebrag heirloom photo booth, activated charcoal coloring book four loko biodiesel austin occupy distillery pickled roof party butcher bespoke. Four loko readymade 8-bit raclette occupy next level, swag sriracha mumblecore scenester snackwave squid lumbersexual truffaut. Food truck leggings cray, chia synth tbh vinyl jianbing. Hoodie man braid thundercats YOLO, pinterest tumblr yr dreamcatcher sustainable cold-pressed raw denim. DIY bushwick williamsburg, wayfarers truffaut live-edge locavore 90's copper mug woke kale chips godard gluten-free umami twee. Ramps etsy beard man braid keffiyeh austin. Tumblr everyday carry offal man bun.",false,0,0,2]
]

article_list.each do |title, body, featured, readcount, rating, category_id|
  Article.create(title: title, body: body, featured: featured, readcount: readcount, rating: rating, category_id: category_id)
end

  Author.first.articles << Article.first
  Author.last.articles << Article.last

puts "Seed planted!"


