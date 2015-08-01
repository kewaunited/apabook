# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

# Accounts
account1 = Account.create(first_name: 'John', last_name: 'Doe', email: 'john.doe@doe.com', password: '12345', password_confirmation: '12345')
account2 = Account.create(first_name: 'Dawid', last_name: 'Leszczyński', email: 'dawid.leszczynski@gmail.com', password: '12345', password_confirmation: '12345')

# Addresses
address1 = Address.create(city: 'Warsaw', street: 'Aleje Jerozlimskie 20', zip_code: '00-102')
address2 = Address.create(city: 'Berlin', street: 'Polen Strasse 2123', zip_code: '00102-123')
address3 = Address.create(city: 'London', street: 'George Street 45B', zip_code: 'LO 1234')

# Images
image1 = Image.create(image: File.open('app/assets/images/seed/blue_almond.jpg'))
image2 = Image.create(image: File.open('app/assets/images/seed/fireplace.jpg'))
image3 = Image.create(image: File.open('app/assets/images/seed/family_house.jpg'))

# Apartments
apartment1 = Apartment.create(name: 'Blue Almond', door_number: '22', bedroom_count: 2, bathroom_count: 1, floor: 1, min_guests: 2, max_guests: 4, day_price: 230.00, min_stay: 2, week_price: 1200.00, address: address1, image: image1, active: true, owner: account2)

apartment2 = Apartment.create(name: 'Fireplace', door_number: '15', bedroom_count: 2, bathroom_count: 1, floor: 2, min_guests: 4, max_guests: 4, day_price: 230.00, min_stay: 2, address: address2, image: image2, active: true, owner: account2)

apartment3 = Apartment.create(name: 'Family House', door_number: '10', bedroom_count: 2, bathroom_count: 1, floor: 0, min_guests: 2, max_guests: 6, day_price: 260.00, min_stay: 2, address: address3, image: image3, active: true, owner: account2)
