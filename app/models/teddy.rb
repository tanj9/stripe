class Teddy < ApplicationRecord
  belongs_to :category
  has_many :orders
end
