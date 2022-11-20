class LikesController < ApplicationController
  before_action :recipe_params, only: [:create, :destroy]

  def create
    Like.create(user_id: current_user.id, recipe_id: params[:id])
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, recipe_id: params[:id])
    like.destroy
  end

  private

  def recipe_params
    @recipe = Recipe.find(params[:id])
  end
end
