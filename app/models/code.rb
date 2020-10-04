class Code < ApplicationRecord
  self.primary_key = :name

  has_many :products, foreign_key: :code_name, inverse_of: :code
  validates :name, uniqueness: true
  enum type: { basic: 1, maximal: 2, actual: 3 }

  def discount(other = 0)
    case type
    when 'maximal' then [self[:discount], other].min
    when 'actual' then self[:discount]
    when 'basic' then other
    end
  end
end
