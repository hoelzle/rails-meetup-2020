class Code < ApplicationRecord
  self.primary_key = :name

  enum type: { basic: 1, maximal: 2, actual: 3 }

  validates :name, uniqueness: true

  def discount(other = 0)
    case type
    when 'maximal' then [self[:discount], other].min
    when 'actual' then self[:discount]
    when 'basic' then other
    end
  end
end
