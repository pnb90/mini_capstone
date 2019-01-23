class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { in: 1..254 }  

  validates :price, presence: true
  validates :price, numericality: { less_than: 100_000_000_000_000_000, greater_than: 0 }
  
  validates :description, presence: true
  validates :description, length: { in: 10..300 }


  
  def is_discounted?
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
  
end
