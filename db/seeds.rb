# create users
user_names = ["riku", "sora", "kairi", "cloud"]
user_names.each do |user_name|
  User.create(name: user_name, email: "#{user_name}@kh.com", password: "#{user_name}pass")
end

# # create carts and associate them to a user
# for User.all.each do |user|
#   3.times { |i| user.carts.create(name: "#{user.name}'s wish list ##{i}") }
# end

# #create items
# items = {
#   {name: "orange", price: , inventory: },
#   orange: ,
#   apple: ,
#   nintendo_switch: ,
#   ,
# }
# for items


