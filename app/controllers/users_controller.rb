class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) #ユーザーのidを所得
    @recipes = @user.recipes #ユーザーのレシピテーブルを所得
  end
end
