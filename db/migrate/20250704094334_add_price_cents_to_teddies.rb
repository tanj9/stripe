class AddPriceCentsToTeddies < ActiveRecord::Migration[8.0]
  def change
    add_column :teddies, :price_cents, :integer, default: 0, null: false
  end
end
