class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, :cost, :country_of_orgin, presence: true 
  validates_length_of :name, maximum: 100 
  
  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
  scope :most_reviews, -> {(
    select("products.id, products.name, products.cost, products.country_of_orgin, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("projects.id")
    .order("reviews_count DESC")
    .limit(1)
  )}
  
  scope :usa, -> { where(country_of_orgin: "United States Of America") }
  
  before_save(:titlelize_product)
  
  private 
    def titlelize_product
      self.name = self.name.titleize
    end
end