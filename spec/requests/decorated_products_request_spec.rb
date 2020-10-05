require 'rails_helper'

RSpec.describe 'DecoratedProducts', kind: :request do
  let(:customer) { create :customer, discount: discount }
  let(:discount) { 20 }

  describe 'GET /show' do
    let(:product) { create :product, price: 100, code: code }
    let(:code) { create :code, :maximal, discount: 10 }

    it 'returns http success' do
      get decorated_product_path product, customer_id: customer.id
      expect(response).to have_http_status(:success)
      expect(body).to match hash_including price: 100, net_price: 90
    end
  end

  describe 'GET /index' do
    let!(:products) { create_list :product, 2 }
    let!(:customer) { create :customer, discount: 10 }

    it 'returns http success' do
      get decorated_products_path
      expect(response).to have_http_status(:success)
      expect(body).to contain_exactly \
        hash_including(:name, :price),
        hash_including(:name, :price)
    end
  end
end
