module Representers
  class Product < Representable::Decorator
    include Representable::JSON

    property :id
    property :name
    property :description
    property :price, getter: ->(_) { price.round }
    property :discount
    property :net_price, getter: ->(_) { net_price.round }
  end
end
