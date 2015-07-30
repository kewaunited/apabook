FactoryGirl.define do
  factory :account do
    first_name 'John'
    last_name 'Doe'
    email 'john.doe@doe.com'
    password '12345'
    password_confirmation '12345'
  end

  factory :invalid_account, class: 'Account' do
    first_name 'John'
    last_name 'Doe'
    email 'john.doe@doe.com'
    password '12345'
    password_confirmation '54321'
  end
end
