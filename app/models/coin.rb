class Coin < ApplicationRecord
  has_many :wishlists
  has_many :collections
end
