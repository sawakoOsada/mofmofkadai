class Property < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :address, presence: true
  validates :years, presence: true, numericality: { only_integer: true }
  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations, reject_if: :reject_station, allow_destroy: true

  def reject_station(attributes)
    exists = attributes[:id].present?
    empty = attributes[:station_name].blank?
    attributes.merge!(_destroy: 1) if exists || empty
    !exists && empty
  end
end
