class Apartment < ActiveRecord::Base
  extend Dragonfly::Model
  extend Dragonfly::Model::Validations
  dragonfly_accessor :image
  validates_size_of :image, maximum: 2000.kilobytes, message: 'should be less than 2000 kb.'
  validates_property :format, of: :image, in: %w(jpeg jpg png gif)

  validates :name, :door_number, :bedroom_count, :bathroom_count, :floor, :min_guests, :max_guests, :day_price, :min_stay, presence: true
  validates :active, inclusion: { in: [true, false] }
  scope :active, -> { where(active: true) }

  belongs_to :address
  belongs_to :owner, class_name: 'Account'

  accepts_nested_attributes_for :address

  def formatted_guests
    max_guests != min_guests ? [min_guests, max_guests - min_guests].join(' + ') : max_guests
  end
end
