class Apartment < ActiveRecord::Base
  validates :name, :door_number, :bedroom_count, :bathroom_count, :floor, :min_guests, :max_guests, :day_price, :min_stay, presence: true
  validates :active, inclusion: { in: [true, false] }

  belongs_to :address
  belongs_to :image
  belongs_to :owner, class_name: 'Account'

  accepts_nested_attributes_for :address

  scope :active, -> { where(active: true) }

  def self.in_city(city)
    joins(:address).where('city like ?', city)
  end

  def self.bedrooms(bedrooms)
    where(bedroom_count: bedrooms)
  end

  def self.bathrooms(bathrooms)
    where(bathroom_count: bathrooms)
  end

  def self.guest_count(guests)
    where('? <= max_guests', guests)
  end

  def self.day_price_between(from, to)
    where(day_price: from..to)
  end

  def self.search(params)
    ApartmentsQuery.new(params).results
  end

  def formatted_guests
    max_guests != min_guests ? [min_guests, max_guests - min_guests].join(' + ') : max_guests
  end
end
