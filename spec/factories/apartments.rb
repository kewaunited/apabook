FactoryGirl.define do
  factory :apartment do
    name 'Chocolate'
    door_number '10'
    bedroom_count 1
    bathroom_count 1
    room_description 'One bedroom apartment with a living room. It has an open-plane kitchen, a bathroom with a shower. Free WiFi Internet is available for free to all our guests.'
    floor 1
    min_guests 2
    max_guests 4
    day_price 120.00
    week_price 600.00
    active true
    address

    factory :apartment_inactive do
      active false
    end
  end
end
