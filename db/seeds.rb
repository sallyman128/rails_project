# create Teachers and Students + associate them through subjects
# create Subjects
subjects = ["math", "science", "history"]
# 3.times {|i| Subject.new(name: subjects[i], room_number: Faker::Number.hexadecimal(3).upcase)}

3.times do |i|
  teacher1 = Teacher.create(name: Faker::GameOfThrones.character, email: Faker::Internet.email, password:Faker::Pokemon.name)
  teacher2 = Teacher.create(name: Faker::GameOfThrones.character, email: Faker::Internet.email, password:Faker::Pokemon.name)

  student1 = Student.create(name: Faker::StarWars.character, birthdate: Faker::Date.between(25.years.ago, 18.years.ago))
  student2 = Student.create(name: Faker::StarWars.character, birthdate: Faker::Date.between(25.years.ago, 18.years.ago))
  student3 = Student.create(name: Faker::StarWars.character, birthdate: Faker::Date.between(25.years.ago, 18.years.ago))
  
  student1.subjects << teacher1.subjects.create(name: subjects[i], room_number: Faker::Number.hexadecimal(3).upcase)
  student2.subjects << teacher1.subjects.create(name: subjects[i], room_number: Faker::Number.hexadecimal(3).upcase)
  student3.subjects << teacher1.subjects.create(name: subjects[i], room_number: Faker::Number.hexadecimal(3).upcase)

  student1.subjects << teacher2.subjects.create(name: subjects[i], room_number: Faker::Number.hexadecimal(3).upcase)
  student2.subjects << teacher2.subjects.create(name: subjects[i], room_number: Faker::Number.hexadecimal(3).upcase)
  student3.subjects << teacher2.subjects.create(name: subjects[i], room_number: Faker::Number.hexadecimal(3).upcase)

end
