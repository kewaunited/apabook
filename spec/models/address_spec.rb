require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:address)).to be_valid
  end

  it 'is invalid without a city' do
    expect(FactoryGirl.build(:address, city: nil)).to_not be_valid
  end

  it 'is invalid without a street' do
    expect(FactoryGirl.build(:address, street: nil)).to_not be_valid
  end

  it 'is invalid without a zip code' do
    expect(FactoryGirl.build(:address, zip_code: nil)).to_not be_valid
  end
end
