class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.integer :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.integer :city, null: false
      t.integer :house_number, null: false
      t.integer :building_name
      t.string :phone, null: false
      t.references :order, foregin_key: true

      t.timestamps
    end
  end
end
