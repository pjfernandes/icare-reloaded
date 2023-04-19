class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      #t.references :caregiver, null: false, foreign_key: true
      #t.references :client, null: false, foreign_key: true
      t.integer :days
      t.float :total_price
      t.string :payment_type
      t.string :payment_status
      t.boolean :caregiver_accept
      t.integer :client_id
      t.integer :caregiver_id

      t.timestamps
    end
  end
end
