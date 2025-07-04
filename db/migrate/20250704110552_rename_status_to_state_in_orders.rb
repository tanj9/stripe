class RenameStatusToStateInOrders < ActiveRecord::Migration[8.0]
  def change
    rename_column :orders, :status, :state
  end
end
