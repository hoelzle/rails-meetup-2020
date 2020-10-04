require 'rails_helper'

RSpec.describe Decorators::RegularPrice do
  let(:product) { create :product, code: code, price: 100 }
  let(:code) { create :code, name: 'F', type: :maximal, discount: 30 }
  let(:customer) { create :customer, discount: 40 }
  let(:decorated) { described_class.new product, customer }

  it 'takes code into account' do
    expect(decorated.net_price).to eq 70
  end
end
