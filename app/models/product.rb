class Product < ActiveRecord::Base
  validates :name, :price, :number_count, presence: true
  validates :name, uniqueness: true
end
