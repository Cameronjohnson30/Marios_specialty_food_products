Product.destroy_all
Review.destroy_all
User.destroy_all

admin = User.create(:email => 'Admin@aol.com', :password => 'Password', :admin => true)
user = User.create(:email => 'User@aol.com', :password => 'Password')

50.times do
  product = Product.create(
    name: Faker::Food.unique.spice,
    cost: Faker::Number.decimal(l_digits: 2),
    country_of_orgin: Faker::Address.country
  )

  5.times do 
    Review.create!(
      author: Faker::JapaneseMedia::Naruto.character,
      content_body: Faker::Lorem.paragraph_by_chars(number: 60),
      rating: Faker::Number.between(from: 1, to: 5),
      product_id: product.id
    )
  end
  p "Created #{Review.count} reviews"
end
p "Created #{Product.count} products"