class ProductsController < ApplicationController
  def show
    @product = Product.find permitted_params[:id]
    render json: @product
  end

  def index
    @products = Product.all
    render json: @products
  end

  private

  def permitted_params
    params.permit :id
  end
end
