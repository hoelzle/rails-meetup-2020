require 'rails_helper'

RSpec.describe Decorators::RegularPrice do
  subject(:decorated) { described_class.new product, customer }

  let(:product) { create :product, code: code, price: 100 }
  let(:code) { create :code, kind: :maximal, discount: 10 }
  let(:customer) { create :customer, discount: 20 }

  it 'takes code into account' do
    expect(decorated).to match_price 100, 10, 90
  end
end
