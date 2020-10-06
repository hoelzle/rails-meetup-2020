module Reptresenters
  class Product < Representable::Decorator
    include Representable::JSON

    property :id
    property :name
    property :description
    property :price
    property :discount
    property :volume_discount
    property :net_price
  end
end
