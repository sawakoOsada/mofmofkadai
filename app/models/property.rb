class Property < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :address, presence: true
  validates :years, presence: true, numericality: { only_integer: true }

  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations, reject_if: proc { |attributes| attributes['station_name'].blank? }, allow_destroy: true
end
