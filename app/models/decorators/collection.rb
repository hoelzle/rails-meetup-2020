module Decorators
  class Collection < SimpleDelegator
    include Enumerable
    delegate :each, to: :decorated

    def initialize(collection, context, *decorators)
      super collection
      @context = context
      @decorators = decorators
    end

    private

    def decorated
      @decorated ||= __getobj__.map do |p|
        @decorators.inject p do |decorated, decorator|
          decorator.new decorated, @context
        end
      end
    end
  end
end
