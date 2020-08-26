class Order < ApplicationRecord
    belongs_to :user
    has_many :order_products
    has_many :line_itens
    has_many :products, through: :order_products
    has_many :products, through: :line_itens
end
