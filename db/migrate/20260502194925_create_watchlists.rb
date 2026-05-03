class CreateWatchlists < ActiveRecord::Migration[8.1]
  def change
    create_table :watchlists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :crypto_asset, null: false, foreign_key: true

      t.timestamps
    end
  end
end
