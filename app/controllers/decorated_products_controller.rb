class DecoratedProductsController < ProductsController
  def show
    @decorated_product = Decorators::Price.new @product, customer
    @representer = Representers::Product.new @decorated_product
    render json: @representer
  end

  def index
    @decorated_products = Decorators::Collection.new @products, customer, Decorators::Price
    @representer = Representers::Product.for_collection.new @decorated_products
    render json: @representer
  end

  private

  def customer
    @customer = Customer.find permitted_params[:customer_id]
  end

  def permitted_params
    params.permit :id, :customer_id
  end
end
