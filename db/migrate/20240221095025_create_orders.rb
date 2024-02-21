class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :origin
      t.string :destination
      t.float :weight
      t.float :length
      t.float :width
      t.float :height
      t.decimal :price

      t.timestamps
    end
  end
end
