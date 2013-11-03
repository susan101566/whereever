class CreateHousings < ActiveRecord::Migration
  def change
    create_table :housings do |t|
      t.belongs_to :user
      t.string :title
      t.text :description
      t.text :address
      t.string :image_url

      t.timestamps
    end
  end
end
