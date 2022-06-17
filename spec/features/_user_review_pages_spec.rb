require 'rails_helper'

describe 'test for user creating review' do
  before :each do
    visit root_path
    click_link 'Sign-Up'
    fill_in 'user_email', with: 'useremail@aol.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    @product = Product.create(name:"Bur", country_of_orgin: "USA", cost: 5)
    visit products_path
    click_link 'Bur'
    click_on 'Add a review for this product' 
    fill_in 'review_author', :with => 'cameron'
    fill_in 'Content body', :with => 'a bunch of nonsense tired of typing getting closer to being done aaaaahhhhhhh yeahhhhh'
    fill_in 'Rating', :with => 5
    click_on 'Create Review'
  end

  it "Returns to the product page" do 
    save_and_open_page
    click_link 'Cameron'
    click_link 'Return to product'
    expect(page).to have_content 'Here are the reviews for this product:'
  end
end
