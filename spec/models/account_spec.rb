require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:account)).to be_valid
  end

  it 'is invalid without a first name' do
    expect(FactoryGirl.build(:account, first_name: nil)).to_not be_valid
  end

  it 'is invalid without a last name' do
    expect(FactoryGirl.build(:account, last_name: nil)).to_not be_valid
  end

  it 'is invalid without an email' do
    expect(FactoryGirl.build(:account, email: nil)).to_not be_valid
  end

  it 'is invalid without a password' do
    expect(FactoryGirl.build(:account, password: nil)).to_not be_valid
  end

  it 'is invalid without a password confirmation' do
    expect(FactoryGirl.build(:account, password_confirmation: nil)).to_not be_valid
  end
end

describe '.authenticate' do
  before(:all) do
    FactoryGirl.create(:account)
  end

  it 'authenticates if credentials are ok' do
    expect(Account.authenticate('john.doe@doe.com', '12345')).to be_truthy
  end

  it 'authenticates only if all credentials are ok' do
    expect(Account.authenticate('wrong@wrong.com', 'incorrect')).to be_falsey
  end

  it 'authenticates if the password is correct' do
    expect(Account.authenticate('wrong@wrong.com', '12345')).to be_falsey
  end

  it 'authenticates if the email is correct' do
    expect(Account.authenticate('john.doe@doe.com', 'incorrect')).to be_falsey
  end
end

describe '.account_name' do
  it 'returns formatted account name' do
    expect(FactoryGirl.create(:account).account_name).to eq('John Doe')
  end
end
