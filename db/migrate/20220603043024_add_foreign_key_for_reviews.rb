class AddForeignKeyForReviews < ActiveRecord::Migration[5.2]
  def change
    add_foreign_ key :reviews, :products
  end
end
