class OrdesProduct < ApplicationRecord
    belongs_to :order
    has_many :product, dependent: :destroy
end
