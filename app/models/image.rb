class Image < ActiveRecord::Base
  extend Dragonfly::Model
  extend Dragonfly::Model::Validations
  dragonfly_accessor :image

  has_one :apartment

  validates_size_of :image, maximum: 2000.kilobytes, message: 'should be less than 2000 kb.'
  validates_property :format, of: :image, in: %w(jpeg jpg png gif)
end
