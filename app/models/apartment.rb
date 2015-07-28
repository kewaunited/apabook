class Apartment < ActiveRecord::Base
  validates :name, :door_number, :bedroom_count, :bathroom_count, :floor, presence: true
end
