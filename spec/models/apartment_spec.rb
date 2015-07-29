require 'rails_helper'

RSpec.describe Apartment, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:apartment)).to be_valid
  end

  it 'is invalid without a name' do
    expect(FactoryGirl.build(:apartment, name: nil)).to_not be_valid
  end

  it 'is invalid without a door number' do
    expect(FactoryGirl.build(:apartment, door_number: nil)).to_not be_valid
  end

  it 'is invalid without a bedroom count' do
    expect(FactoryGirl.build(:apartment, bedroom_count: nil)).to_not be_valid
  end

  it 'is invalid without a bathroom count' do
    expect(FactoryGirl.build(:apartment, bathroom_count: nil)).to_not be_valid
  end

  it 'is invalid without a floor number' do
    expect(FactoryGirl.build(:apartment, floor: nil)).to_not be_valid
  end

  it 'is invalid without a min guests' do
    expect(FactoryGirl.build(:apartment, min_guests: nil)).to_not be_valid
  end

  it 'is invalid without a max guests' do
    expect(FactoryGirl.build(:apartment, max_guests: nil)).to_not be_valid
  end

  it 'formats guests correctyl' do
    expect FactoryGirl.create(:apartment).formatted_guests == '2 + 2'
  end

  it 'is invalid without a day price' do
    expect(FactoryGirl.build(:apartment, day_price: nil)).to_not be_valid
  end

  it 'is valid without a week price' do
    expect(FactoryGirl.build(:apartment, week_price: nil)).to be_valid
  end
end
