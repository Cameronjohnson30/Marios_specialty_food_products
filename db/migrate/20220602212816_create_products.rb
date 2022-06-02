class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.column(:name, :string)
      t.column(:country_of_orgin, :string)
      t.column(:cost, :integer)

      t.timestamps()
    end
  end
end
