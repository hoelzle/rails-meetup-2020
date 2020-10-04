require 'rails_helper'

RSpec.describe Product do
  let(:product) { create :product }

  it 'is valid' do
    expect(product).to be_valid
  end
end
