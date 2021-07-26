# frozen_string_literal: true

class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[show update destroy]

  def index
    @ingredients = Ingredient.all.order(created_at: :desc).page(params[:page] || 1).per(15)

    render json: @ingredients
  end

  def show
    render json: @ingredient
  end

  def create
    Ingredient.new(ingredient_params).save
  end

  def destroy
    @ingredient.destroy
  end

  def update
    @ingredient.update(ingredient_params)
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :min_price, :max_price)
  end
end
