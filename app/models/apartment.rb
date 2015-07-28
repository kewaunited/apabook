class Apartment < ActiveRecord::Base
  validates :name, :door_number, :bedroom_count, :bathroom_count, :floor, presence: true

  belongs_to :address
  accepts_nested_attributes_for :address
end
