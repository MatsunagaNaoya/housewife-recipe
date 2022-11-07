class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

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
    @comments = @recipe.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    redirect_to root_path if current_user.id != @recipe.user_id
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @recipe.user_id
      @recipe.destroy
      redirect_to root_path
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:image, :name, :info, :category_id,
                                   :cooking_time_id).merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
