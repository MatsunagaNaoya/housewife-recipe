require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before do
    @recipe = FactoryBot.build(:recipe)
  end

  describe 'レシピ投稿保存' do
    context '投稿保存できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、prefecture_idが存在すれば登録できる' do
        expect(@recipe).to be_valid
      end
    end
    context '投稿保存できないとき' do
      it 'userが紐づいてないと投稿できない' do
        @recipe.user = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include('User must exist')
      end
      it 'imageが空では投稿できない' do
        @recipe.image = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では投稿できない' do
        @recipe.name = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Name can't be blank")
      end
      it 'infoが空では投稿できない' do
        @recipe.info = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Info can't be blank")
      end
      it 'category_idが1(---)では投稿できない' do
        @recipe.category_id = 1
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Category can't to in valid")
      end
      it 'cooking_time_idが1(---)では投稿できない' do
        @recipe.cooking_time_id = 1
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Cooking time can't to in valid")
      end
    end
  end
end
