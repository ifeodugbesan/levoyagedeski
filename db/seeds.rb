# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

count = 1

# 400.times do
#   Batch.create(number: "Batch ##{count}")
#   count += 1
# end

50.times do
  user = User.new(  first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                  )
  user.email = "#{user.first_name}@gmail.com"
  user.password = 123456
  user.batch = Batch.find(count)
  user.username = "#{user.first_name}#{count}"
  count += 1
  puts "creating the user '#{user.first_name} #{user.last_name}'"
  user.save!
end
