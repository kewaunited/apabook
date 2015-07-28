class Address < ActiveRecord::Base
  validates :city, :street, :zip_code, presence: true

  has_one :apartment
end
