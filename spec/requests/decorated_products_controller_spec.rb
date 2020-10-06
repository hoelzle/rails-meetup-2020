require 'rails_helper'

RSpec.describe DecoratedProductsController do
  let(:customer) { create :customer, discount: discount }
  let(:discount) { 20 }
  let(:code) { create :code, :maximal, discount: 10 }
  let(:params) { { customer_id: customer.id } }

  describe 'GET /show' do
    let(:product) { create :product, price: 100, code: code }

    it 'returns http success' do
      get decorated_product_path product, params: params
      expect(response).to be_successful
      expect(body).to match hash_including \
        price: 100, discount: 10, net_price: 90
    end
  end

  describe 'GET /index' do
    let!(:products) { create_list :product, 2, code: code }

    it 'returns http success' do
      get decorated_products_path, params: params

      expect(response).to be_successful
      expect(body).to contain_exactly \
        hash_including(:name, :price, :discount, :net_price),
        hash_including(:name, :price, :discount, :net_price)
    end
  end
end
