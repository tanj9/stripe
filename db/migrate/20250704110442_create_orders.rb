class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.string :teddy_sku
      t.integer :amount_cents
      t.string :checkout_session_id
      t.references :user, null: false, foreign_key: true
      t.references :teddy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
