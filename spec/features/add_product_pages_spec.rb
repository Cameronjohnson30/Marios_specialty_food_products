require 'rails_helper'

  describe "the add a product process" do
  before :each do
      visit products_path
      click_link 'Add new product'
      fill_in 'Name', :with => 'Giant Steps'
      fill_in 'product_country_of_orgin', :with => 'USA'
      fill_in 'Cost', :with => 5
      click_on 'Create Product'
      expect(page).to have_content 'Products'
    end

    it "gives an error when no name is entered" do
      visit new_product_path
      click_on 'Create Product'
      expect(page).to have_content "Name can't be blank"
    end


    it "edits a projects name orgin and price" do
      click_on 'Giant Steps'
      click_on 'Edit'
      fill_in 'Name', :with => 'Giant'
      fill_in 'product_country_of_orgin', :with => 'USS'
      fill_in 'Cost', :with => 666
      click_on 'Update Product'
      expect(page).to have_content "Giant"
  end

  it "creates a new review" do 
    click_on 'Giant Steps'
    click_on 'Add a review for this product'
    expect(page).to have_content "Add a new review:"
  end

    it "deletes a project" do
      click_link 'Giant Steps'
      click_link 'Delete'
      expect(root_path).not_to have_content "Product successfuly deleted"
    end
end
