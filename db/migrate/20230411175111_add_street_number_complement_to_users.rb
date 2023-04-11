class AddStreetNumberComplementToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :street, :string
    add_column :users, :number, :integer
    add_column :users, :district, :string
    add_column :users, :complement, :string
  end
end
