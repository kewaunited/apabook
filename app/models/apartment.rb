class Apartment < ActiveRecord::Base
  validates :name, :door_number, :bedroom_count, :bathroom_count, :floor, :min_guests, :max_guests, :day_price, presence: true

  belongs_to :address
  accepts_nested_attributes_for :address

  def formatted_guests
    max_guests != min_guests ? [min_guests, max_guests - min_guests].join(' + ') : max_guests
  end
end
