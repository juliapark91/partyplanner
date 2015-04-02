require 'faker'
 
# Create Guests
100.times do
   guest = Guest.create!(
     first_name: Faker::Name.first_name,
     last_name: Faker::Name.last_name, 
     phone: Faker::PhoneNumber.cell_phone,
     email: Faker::Internet.email,     
   )
 end

guests = Guest.all

# Create Party
20.times do
  party = Party.create!(
    title:  Faker::Lorem.sentence,
    started_at: Faker::Time.backward(14, :evening),
    ended_at: Faker::Time.forward(23, :morning),
    #address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip_code: Faker::Address.zip_code,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone
  )
end

parties = Party.all

guest_ids = Guest.pluck(:id)
guest_id = guest_ids.select(:id)

parties.each do |party|
  party.guest_id = guest_id.shuffle[0...4]
end

puts "Seed finished"
puts "#{Guest.count} guests created"
puts "#{Party.count} parties created"