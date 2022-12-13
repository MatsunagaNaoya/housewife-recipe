class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]#ログインしていない場合、indexとshowビューのみ閲覧可能
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]#set_recipeの情報を先に所得(show,edit,update,destroyのみ)

  def index
    @recipes = Recipe.includes(:user).order('created_at DESC')#レシピの情報をユーザーが新規投稿した順に表示
  end

  def new
    @recipe = Recipe.new #レシピ新規投稿内容を入手
  end

  def create
    @recipe = Recipe.create(recipe_params)#レシピ投稿作成データを変数化
    if @recipe.save#保存が成功した場合
      redirect_to root_path#メインページに遷移
    else#保存失敗パターン
      render :new#同じページを再表示(入力データをそのまま)
    end
  end

  def show
    @comments = @recipe.comments.includes(:user)#レシピのコメント等をユーザーデータから所得して変数化
    @comment = Comment.new#コメント投稿した内容を変数化
  end

  def edit
    redirect_to root_path if current_user.id != @recipe.user_id #今のユーザーと投稿したユーザーが違う場合、メインページに遷移
  end

  def update
    if @recipe.update(recipe_params)#更新成功した場合
      redirect_to recipe_path(@recipe.id)#編集した詳細ページに遷移
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @recipe.user_id#今のユーザーと投稿者が同じなら実行
      @recipe.destroy#該当レシピを削除
      redirect_to root_path#トップページに遷移
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
