class AddAdditionalAttributesForStockData < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :previous_close, :decimal
    add_column :stocks, :change, :decimal
    add_column :stocks, :change_percent, :decimal
    add_column :stocks, :ytd_change_percent, :decimal
  end
end
