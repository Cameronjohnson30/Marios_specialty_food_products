require 'rails_helper'

describe 'landing page' do
  before :each do
    visit root_path
    click_link 'See product list'
  end

  it 'Returns from products page to landing' do 
    click_link 'Return to Home'
    expect(page).to have_content 'Marios Specialty Food Products'
  end

  it 'Fills out  the scopes be on the landing page' do 
    visit root_path
    click_link 'Sign-Up'
    fill_in 'user_email', with: 'useremail@aol.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    @user = User.last
    @user.update(admin: true)
    click_link 'See product list'
    click_link 'Add new product'    
    fill_in 'Name', :with => 'Giant Steps'
    fill_in 'product_country_of_orgin', :with => "United States of America"
    fill_in 'Cost', :with => 5
    click_button 'Create Product'
    click_link 'Giant Steps'
    click_on 'Add a review for this product' 
    fill_in 'review_author', :with => 'cameron'
    fill_in 'Content body', :with => 'a bunch of nonsense tired of typing getting closer to being done aaaaahhhhhhh yeahhhhh'
    fill_in 'Rating', :with => 5
    click_on 'Create Review'
    click_link 'Return to products'
    click_link 'Return to Home'
    expect(page).to have_content 'Giant Steps'
  end
end   
