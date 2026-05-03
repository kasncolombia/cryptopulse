class CryptoAssetsController < ApplicationController
  def show
    @asset = CryptoAsset.find(params[:id])
    @price = @asset.prices.order(created_at: :desc).first
    @watchlist_assets = CryptoAsset.limit(5).where.not(id: @asset.id)
  end
end
