class ProductsController < ApplicationController
  def show
  end

  def index
    @products = Product.all
    render json: @products
  end
end
