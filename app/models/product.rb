class Product < ApplicationRecord
  belongs_to :code, foreign_key: :code_name, inverse_of: :products, optional: true
end
