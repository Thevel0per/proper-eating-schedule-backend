# frozen_string_literal: true

class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :min_price, numericality: { greater_than_or_equal_to: 0 }
  validates :max_price, numericality: { greater_than_or_equal_to: 0 }
  validate :ensure_max_price_greater_than_min_price


  def ensure_max_price_greater_than_min_price
    return if max_price >= min_price

    errors.add(:max_price, 'has to be greater than min price')
  end
end
