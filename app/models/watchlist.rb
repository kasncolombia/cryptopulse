class Watchlist < ApplicationRecord
  belongs_to :user
  belongs_to :crypto_asset
end
