namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    10.times do |n|
      puts "[DEBUG] creating user #{n + 1} of 10"
      name = Faker::Name.name
      email = Faker::Internet.free_email(name)
      password = Faker::Internet.password(10, 20)
      puts "[DEBUG] username=#{email} password=#{password}"
      user = User.create!(name: name,
                          email: email,
                          password: password,
                          password_confirmation: password)
      10.times do |m|
        puts "Generating random parking location #{m + 1} of 10"
        latitude = Faker::Address.latitude
        longitude = Faker::Address.longitude
        loc = ParkingLocation.create!(latitude: latitude,
                                      longitude: longitude,
                                      user: user, status: %w(free occupied).sample)

        puts "[DEBUG] Generated Latitude=#{latitude}; Generated Longitude=#{longitude} with record id #{loc.id}"
      end
    end
    puts 'Done -- save the output from this script if you care.'
  end
end
