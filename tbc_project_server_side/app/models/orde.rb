class Orde < ApplicationRecord
    belongs_to :user
    has_many :orders_product, dependent: :destroy
end
