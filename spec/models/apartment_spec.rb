require 'rails_helper'

RSpec.describe Apartment, type: :model do
  it 'has a valid factory' do
    FactoryGirl.create(:apartment).should be_valid
  end

  it 'is invalid without a name' do
    FactoryGirl.build(:apartment, name: nil).should_not be_valid
  end

  it 'is invalid without a door number' do
    FactoryGirl.build(:apartment, door_number: nil).should_not be_valid
  end

  it 'is invalid without a bedroom count' do
    FactoryGirl.build(:apartment, bedroom_count: nil).should_not be_valid
  end

  it 'is invalid without a bathroom count' do
    FactoryGirl.build(:apartment, bathroom_count: nil).should_not be_valid
  end

  it 'is invalid without a floor number' do
    FactoryGirl.build(:apartment, floor: nil).should_not be_valid
  end
end
