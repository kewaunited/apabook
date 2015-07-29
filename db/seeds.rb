# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
address1 = Address.create(city: 'Warsaw', street: 'Aleje Jerozlimskie 20', zip_code: '00-102')

address2 = Address.create(city: 'Berlin', street: 'Polen Strasse 2123', zip_code: '00102-123')

address3 = Address.create(city: 'London', street: 'George Street 45B', zip_code: 'LO 1234')

apartment1 = Apartment.create(name: 'Flower', door_number: '22', bedroom_count: 1, bathroom_count: 1, floor: 4, min_guests: 2, max_guests: 4, day_price: 120.00, week_price: 600.00, address: address1)

apartment2 = Apartment.create(name: 'Comfortable', door_number: '15', bedroom_count: 2, bathroom_count: 1, floor: 3, min_guests: 4, max_guests: 6, day_price: 200.00, address: address2)

apartment3 = Apartment.create(name: 'Chocolate', door_number: '10', bedroom_count: 1, bathroom_count: 1, floor: 2, min_guests: 4, max_guests: 4, day_price: 130.00, address: address3)
