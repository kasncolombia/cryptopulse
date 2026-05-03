class CreateCryptoAssets < ActiveRecord::Migration[8.1]
  def change
    create_table :crypto_assets do |t|
      t.string :name
      t.string :symbol
      t.string :coingecko_id
      t.string :image_url

      t.timestamps
    end
    add_index :crypto_assets, :symbol
    add_index :crypto_assets, :coingecko_id
  end
end
