require 'rails_helper'

RSpec.describe Code do
  subject!(:code) { create :code, name: 'A', kind: kind, discount: discount }

  describe 'primary key uniqueness' do
    let(:kind) { :basic }
    let(:discount) { 30 }

    it 'validates the uniqueness of the primary key' do
      expect(build(:code, name: 'A')).not_to be_valid
    end
  end

  context 'when maximal' do
    let(:kind) { :maximal }
    let(:discount) { 30 }

    describe '.discount' do
      it 'works correctly' do
        expect(code.discount(40)).to eq 30
        expect(code.discount(20)).to eq 20
      end

      it 'is 0 without given discount' do
        expect(code.discount).to eq 0
      end
    end
  end

  context 'when actual' do
    let(:kind) { :actual }
    let(:discount) { 30 }

    describe '.discount' do
      it 'works correctly' do
        expect(code.discount(40)).to eq 30
        expect(code.discount(20)).to eq 30
      end

      it 'is actual discount even when no other is given' do
        expect(code.discount).to eq 30
      end
    end
  end

  context 'when basic' do
    let(:kind) { :basic }
    let(:discount) { [nil, 10].sample }

    describe '.discount' do
      it 'works correctly' do
        expect(code.discount(40)).to eq 40
        expect(code.discount(20)).to eq 20
      end

      it 'is 0 when no discount is given' do
        expect(code.discount).to eq 0
      end
    end
  end
end
