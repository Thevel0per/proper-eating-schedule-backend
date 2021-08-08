# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @recipes = Recipe.all.order(created_at: :desc).page(params[:page] || 1).per(15)

    render json: ::RecipeBlueprint.render(@recipes)
  end

  def create
    @recipe = Recipe.new(recipe_params).save
  end

  def show
    render json: ::RecipeBlueprint.render(@recipe)
  end

  def update
    @recipe.update(recipe_params)
  end

  def destroy
    @recipe.destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :name,
      :instructions,
      recipe_ingredients_attributes: [:id, :ingredient_id, :quantity, :measurement, :_destroy]
    )
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
