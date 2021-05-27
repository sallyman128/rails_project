3.times {User.create(name: Faker::StarWars.character, email: Faker::Internet.email, password: "password")}
10.times {Painting.create(title: Faker::Book.title, artist_name: Faker::GameOfThrones.character, country: Faker::Address.country)}
3.times do |i|
  gallery1 = User.all[i].galleries.create(name: Faker::App.name)
  gallery2 = User.all[i].galleries.create(name: Faker::App.name)
  gallery1.paintings << Painting.all[i]
  gallery1.paintings << Painting.all[i+1]
  gallery2.paintings << Painting.all[i+2]
  gallery2.paintings << Painting.all[i+3]
end
