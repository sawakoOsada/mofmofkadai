class Property < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality:only_integer
  validates :address, presence: true
  validates :years, presence: true, numericality:only_integer
end
