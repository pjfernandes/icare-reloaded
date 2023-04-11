class CreateCaregivers < ActiveRecord::Migration[7.0]
  def change
    create_table :caregivers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :care_type
      t.float :value
      t.string :formation

      t.timestamps
    end
  end
end
