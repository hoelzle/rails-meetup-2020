class DecoratedProductsController < ProductsController
  def show
    @product = Decorators::Price.new @product, customer
    super
  end

  private

  def customer
    @customer = Customer.find_by id: permitted_params[:customer_id]
  end

  def permitted_params
    params.permit :id, :customer_id
  end
end
