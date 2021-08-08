# frozen_string_literal: true

class RecipeBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :instructions
  association :recipe_ingredients, blueprint: ::RecipeIngredientBlueprint
end
