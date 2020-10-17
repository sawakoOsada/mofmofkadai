class Station < ApplicationRecord
  validates :route_name, presence: true
  validates :station_name, presence: true
  validates :minutes, presence: true, numericality: { only_integer: true }
  belongs_to :property
end
