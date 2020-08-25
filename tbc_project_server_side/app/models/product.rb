class Product < ApplicationRecord
    has_many :order_products
    has_one_attached :img_url
    # has_many :orders, through: :order_products
end
