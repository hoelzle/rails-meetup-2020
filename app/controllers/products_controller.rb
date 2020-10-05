class ProductsController < ApplicationController
  before_action :product, only: :show
  before_action :products, only: :index

  def show
    render json: @product
  end

  def index
    render json: @products
  end

  private

  def product
    @product = Product.find permitted_params[:id]
  end

  def products
    @products = Product.all
  end

  def permitted_params
    params.permit :id
  end
end
