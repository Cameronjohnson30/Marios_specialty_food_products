require 'rails_helper'

  describe "the add a review process" do
  before :each do
    visit root_path
    click_link 'Sign-Up'
    fill_in 'user_email', with: 'useremail@gmail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    @user = User.last
    @user.update(admin: true)
    click_link 'See product list'
    click_link 'Add new product'    
    fill_in 'Name', :with => 'Giant Steps'
    fill_in 'product_country_of_orgin', :with => 'USA'
    fill_in 'Cost', :with => 5
    click_button 'Create Product'
    click_link 'Giant Steps'
    click_on 'Add a review for this product' 
    fill_in 'review_author', :with => 'cameron'
    fill_in 'Content body', :with => 'a bunch of nonsense tired of typing getting closer to being done aaaaahhhhhhh yeahhhhh'
    fill_in 'Rating', :with => 5
    click_on 'Create Review'
    click_link 'Cameron'
  end

    it "Edits a review" do
      click_link 'Edit review'
      fill_in 'Author', :with => 'cameron is amazing'
      fill_in 'Content body', :with => 'a bunch of nonsense tired of typing getting closer to being done aaaaahhhhhhh yeahhhhh'
      fill_in 'Rating', :with => 5
      click_on 'Update Review'
      expect(page).to have_content 'Cameron Is Amazing'
    end

    it "Returns to the product page from edit review page" do
      click_link 'Edit review'
      click_link 'Return to product'
      expect(page).to have_content 'Add a review for this product'
    end

    it "Deletes a review" do 
      click_link 'Delete review'
      expect(page).to have_content 'Review successfully deleted'
    end

    it "Returns to the product page" do
      click_link 'Return to product'
    expect(page).to have_content 'Here are the reviews for this product:'
  end
end