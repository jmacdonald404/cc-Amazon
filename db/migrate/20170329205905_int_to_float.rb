class IntToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :price, :float
  end
end
