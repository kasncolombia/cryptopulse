class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:subcategories).all
  end
end
