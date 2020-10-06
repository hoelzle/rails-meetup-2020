code = FactoryBot.create :code, :maximal, discount: 20, name: 'F'
customer = FactoryBot.create :customer, discount: 10
FactoryBot.create :product, name: 'Noco Booster 12 V', price: 379.00, code: code
FactoryBot.create :product, name: 'Lochkabelschuhe isoliert M3', price: 32.00, code: code
