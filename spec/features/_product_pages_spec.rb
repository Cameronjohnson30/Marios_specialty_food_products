require 'rails_helper'

  describe "the add a product process" do
    before :each do
      visit products_path
      click_link 'Add new product'
      fill_in 'Name', :with => 'Giant Steps'
      fill_in 'product_country_of_orgin', :with => 'USA'
      fill_in 'Cost', :with => 5
      click_on 'Create Product'
    end

    it "gives an error when no name, cost, or origin is entered" do
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

    it "checkes for empty review" do 
      click_on 'Giant Steps'
      click_on 'Add a review for this product'
      click_on 'Create Review'
      expect(page).to have_content "Please fix these errors:"
    end
    it "deletes a project" do
      click_link 'Giant Steps'
      click_link 'Delete'
      expect(page).to have_content  "Product successfuly deleted"
    end

    it "returns to products page" do 
      click_link 'Giant Steps'
      click_link 'Return to products'
      expect(page).to have_content "Products"
    end
end
