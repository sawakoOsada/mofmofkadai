class Property < ApplicationRecord
<<<<<<< HEAD
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality:only_integer
  validates :address, presence: true
  validates :years, presence: true, numericality:only_integer
=======
>>>>>>> 4c5bd26... CRUD機能実装
end
