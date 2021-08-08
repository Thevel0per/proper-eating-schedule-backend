# frozen_string_literal: true

class RecipeIngredientBlueprint < Blueprinter::Base
  identifier :id
  fields :quantity, :measurement
  association :ingredient, blueprint: ::IngredientBlueprint
end
