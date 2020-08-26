class Product < ApplicationRecord
    has_many :order_products
    has_many :orders, through: :order_products
    has_many :line_itens
    has_many :orders, through: :line_itens

    has_one_attached :img_url

end
