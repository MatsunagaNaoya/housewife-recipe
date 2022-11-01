class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @recipes = Recipe.includes(:user).order('created_at DESC')
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

#  def edit
#  end

#  def update
#  end

#  def destroy
#  end

  private

  def recipe_params
    params.require(:recipe).permit(:image, :name, :info, :category_id,
                                 :cooking_time_id).merge(user_id: current_user.id)
  end

#  def set_item
#    @recipe = Recipe.find(params[:id])
#  end


end
