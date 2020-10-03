require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET /show' do
    it 'returns http success' do
      get '/products/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index' do
    let!(:products) { create_list :product, 2 }

    it 'returns http success' do
      get products_path
      expect(response).to have_http_status(:success)
      expect(json).to contain_exactly \
        hash_including(:name, :price),
        hash_including(:name, :price)
    end
  end
end
