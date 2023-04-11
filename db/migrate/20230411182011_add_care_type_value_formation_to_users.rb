class AddCareTypeValueFormationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :care_type, :string
    add_column :users, :value, :float
    add_column :users, :formation, :string
  end
end
