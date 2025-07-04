class Category < ApplicationRecord
  has_many :teddies, dependent: :destroy
end
