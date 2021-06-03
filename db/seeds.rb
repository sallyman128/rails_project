3.times {User.create(name: Faker::Science.scientist, email: Faker::Internet.email, password: "password")}
10.times {Painting.create(title: Faker::Book.title, artist_name: Faker::Superhero.name, country: Faker::Address.country)}
3.times do |i|
  gallery1 = User.all[i].galleries.create(name: Faker::App.name)
  gallery2 = User.all[i].galleries.create(name: Faker::App.name)
  gallery1.paintings << Painting.all[i]
  gallery1.paintings << Painting.all[i+1]
  gallery2.paintings << Painting.all[i+2]
  gallery2.paintings << Painting.all[i+3]
end

Painting.all.each do |painting|
  User.all.each do |user|
    painting.comments.create(message: Faker::Quotes::Shakespeare.king_richard_iii_quote, user_id: user.id)
  end
end
