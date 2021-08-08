# frozen_string_literal: true

class IngredientBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :min_price, :max_price
end
