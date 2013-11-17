class AddPriceToFurnitures < ActiveRecord::Migration
  def change
    add_column :furnitures, :price, :decimal, precision: 8, 
        scale: 2, default: 0
  end
end
