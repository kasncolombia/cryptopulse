class HomeController < ApplicationController
  def index
    @assets = CryptoAsset.limit(10).order(id: :asc)
    @categories = Category.includes(:subcategories).order(id: :asc)
  end
end
