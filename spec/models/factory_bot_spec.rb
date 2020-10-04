require 'rails_helper'

# This code checks if all factories and their traits are valid.
# Source https://github.com/thoughtbot/factory_bot/wiki/testing-all-factories-(with-rspec)
describe FactoryBot do
  described_class.factories.map(&:name).each do |factory_name|
    describe "#{factory_name} factory" do
      # Test each factory
      it 'is valid' do
        factory = build factory_name
        expect(factory).to be_valid, -> { factory.errors.full_messages.join "\n" } if factory.respond_to? :valid?
      end

      # Test each trait
      described_class.factories[factory_name].definition.defined_traits.map(&:name).each do |trait_name|
        context "with trait #{trait_name}" do
          it 'is valid' do
            factory = build factory_name, trait_name
            expect(factory).to be_valid, -> { factory.errors.full_messages.join "\n" } if factory.respond_to? :valid?
          end
        end
      end
    end
  end
end
