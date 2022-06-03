class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true 
  validates_length_of :name, maximum: 100 

  before_save(:titlelize_product)

  private 
    def titlelize_product
      self.name = self.name.titleize
    end
end