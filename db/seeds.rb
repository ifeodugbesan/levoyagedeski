
# City.destroy_all

cities = [
          "Amsterdam 🇳🇱",
          "Bali 🇮🇩",
          "Barcelona 🇪🇸",
          "Berlin 🇩🇪",
          "Bordeaux 🇫🇷",
          "Brussels 🇧🇪",
          "Buenos Aires 🇦🇷",
          "Casablanca 🇲🇦",
          "Cologne 🇩🇪"
          "Dubai 🇦🇪",
          "Istanbul 🇹🇷",
          "Lausanne 🇨🇭",
          "Lille 🇫🇷",
          "Lima 🇵🇪"
          "Lisbon 🇵🇹",
          "London 🇬🇧",
          "Lyon 🇫🇷",
          "Madrid 🇪🇸",
          "Marseille 🇫🇷",
          "Mauritius 🇲🇺"
          "Melbourne 🇦🇺",
          "Mexico 🇲🇽",
          "Milan 🇮🇹",
          "Montreal 🇨🇦",
          "Munich 🇩🇪",
          "Nantes 🇫🇷",
          "Nice 🇫🇷",
          "Oslo 🇳🇴",
          "Paris 🇫🇷",
          "Rennes 🇫🇷",
          "Rio de Janeiro 🇧🇷",
          "Santiago 🇵🇭"
          "Shanghai 🇨🇳",
          "Singapore 🇸🇬",
          "São Paulo 🇧🇷",
          "Tel Aviv 🇮🇱"
          "Tokyo 🇯🇵"
          "Online"
        ]

cities.each do |city|
  City.create!(name: city)
end

# count = 1

# 425.times do
#   Batch.create(number: count)
#   count += 1
# end

# 50.times do
#   user = User.new(  first_name: Faker::Name.first_name,
#                     last_name: Faker::Name.last_name,
#                   )
#   user.email = "#{user.first_name}@gmail.com"
#   user.password = 123456
#   user.batch = Batch.find(count)
#   user.username = "#{user.first_name}#{count}"
#   count += 1
#   puts "creating the user '#{user.first_name} #{user.last_name}'"
#   user.save!
# end


# count = 0
# num = 1
# Conversation.between(User.find(4), User.find(1)).first.messages.each do |message|
#   message_time = Time.new(2020,05, num, 11, 25, 00)
#   message.update(created_at: message_time, updated_at: message_time)
#   count += 2
#   if count == 10
#     num += 1
#     count = 0
#   end
# end
