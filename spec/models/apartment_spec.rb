require 'rails_helper'

describe Apartment do
  it 'has a valid factory' do
    expect(create_valid_apartment).to be_valid
  end

  describe 'ActiveModel validations' do
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

    it 'is invalid without a day price' do
      expect(FactoryGirl.build(:apartment, day_price: nil)).to_not be_valid
    end

    it 'is valid without a week price' do
      expect(FactoryGirl.build(:apartment, week_price: nil)).to be_valid
    end

    it 'is invalid without a min stay' do
      expect(FactoryGirl.build(:apartment, min_stay: nil)).to_not be_valid
    end
  end

  describe '.formatted_guests' do
    it 'formats guests correctly' do
      expect(create_valid_apartment.formatted_guests).to eq('2 + 2')
    end
  end

  describe 'active' do
    it 'includes active apartments' do
      expect(Apartment.active).to include(create_valid_apartment)
    end
  end

  def create_valid_apartment
    FactoryGirl.create(:apartment)
  end
end
