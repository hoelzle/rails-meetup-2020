require 'rspec/expectations'

module MatcherHelpers
  def delta
    @delta ||= 1.0e-3
  end

  def near?(actual, expected)
    actual == expected || (actual - expected).abs < delta
  end
end

RSpec::Matchers.define :be_near do |expected|
  include MatcherHelpers
  match do |actual|
    near? actual, expected
  end
  description do
    "be near #{expected} (delta = #{delta}"
  end
end

RSpec::Matchers.define :match_price do |price, discount, net_price|
  match do |actual|
    expect(actual.price).to eq price
    expect(actual.discount).to eq discount
    expect(actual.net_price).to be_near net_price
  end
  failure_message do |actual|
    actual_price = %i[price discount net_price].map { |p| actual.send p }.join(', ')
    expected_price = ([price, discount, net_price]).join ', '
    "expected <#{actual.try(:klass) || actual.class}> #{actual_price} to match #{expected_price}"
  end
end
