require 'rails_helper'

  describe "the add a product process" do
    before :each do
      visit root_path
      click_link 'Sign-Up'
      fill_in 'user_email', with: 'useremail@aol.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Sign up'
      @user = User.last
      @user.update(admin: true)
      visit new_product_path
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
      click_link 'Giant Steps'
      click_link 'Edit'
      fill_in 'Name', :with => 'Giant'
      fill_in 'product_country_of_orgin', :with => 'USS'
      fill_in 'Cost', :with => 666
      click_on 'Update Product'
      expect(page).to have_content "Giant"
    end

    it "deletes a project" do
      click_link 'Giant Steps'
      click_link 'Delete'
      expect(page).to have_content  "Product successfuly deleted"
    end

    it "returns to products page from product page" do 
      click_link 'Giant Steps'
      click_link 'Return to products'
      expect(page).to have_content "Products"
    end

    it "Returns to product page from create a review" do 
      click_link 'Giant Steps'
      click_link 'Add a review for this product'
      click_link 'Return to product'
      expect(page).to have_content "Giant Steps"
    end

    it "Returns to product page from edit product page" do
      click_link 'Giant Steps'
      click_link 'Edit'
      click_link 'Return to product'
      expect(page).to have_content "Giant Steps"
    end

    it "checks for empty review" do 
      click_link 'Giant Steps'
      click_on 'Add a review for this product'
      click_on 'Create Review'
      expect(page).to have_content "Please fix these errors:"
    end
  end
