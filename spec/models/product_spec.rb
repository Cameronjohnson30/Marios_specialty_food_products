require 'rails_helper'

describe Product do 
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_orgin }
 
  it("titleizes the name of a product") do
    product = Product.create({name: "bread", cost: "100", country_of_orgin: "united states of america"})
    expect(product.name()).to(eq("Bread"))
  end
end