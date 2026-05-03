class CreatePrices < ActiveRecord::Migration[8.1]
  def change
    create_table :prices do |t|
      t.references :crypto_asset, null: false, foreign_key: true
      t.decimal :price
      t.decimal :change_24h
      t.decimal :market_cap

      t.timestamps
    end
  end
end
