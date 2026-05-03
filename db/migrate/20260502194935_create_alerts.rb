class CreateAlerts < ActiveRecord::Migration[8.1]
  def change
    create_table :alerts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :crypto_asset, null: false, foreign_key: true
      t.decimal :target_price
      t.integer :direction
      t.integer :status

      t.timestamps
    end
  end
end
