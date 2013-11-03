class CreateFurnitures < ActiveRecord::Migration
  def change
    create_table :furnitures do |t|
      t.belongs_to :user
      t.string :title
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
