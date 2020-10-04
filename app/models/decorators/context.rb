module Decorators
  class Context < SimpleDelegator
    attr_reader :context

    def initialize(object, context = nil)
      super object
      @context = context
    end
  end
end
