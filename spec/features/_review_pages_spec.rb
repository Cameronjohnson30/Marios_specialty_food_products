require 'rails_helper'

  describe "the add a product process" do
  before :each do
      visit products_path
      click_link 'Add new product'
      fill_in 'Name', :with => 'Giant Steps'
      fill_in 'product_country_of_orgin', :with => 'USA'
      fill_in 'Cost', :with => 5
      click_on 'Create Product'
      click_link 'Giant Steps'
      expect(page).to have_content 'Review'
    end

    it "Edits a review" do
      
  end