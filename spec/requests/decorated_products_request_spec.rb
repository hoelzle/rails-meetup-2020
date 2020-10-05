require 'rails_helper'

RSpec.describe 'DecoratedProducts', type: :request do
  describe 'GET /show' do
    let(:product) { create :product, name: 'ABC', id: 5 }

    it 'returns http success' do
      get decorated_product_path product
      expect(response).to have_http_status(:success)
      expect(body).to match hash_including id: 5, name: 'ABC'
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
