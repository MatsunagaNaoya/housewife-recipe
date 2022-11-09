class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, { id: 2, name: '主食' }, { id: 3, name: '主菜' },
    { id: 4, name: '副菜' }, { id: 5, name: 'おかず' }, { id: 6, name: '疲労回復レシピ' },
    { id: 7, name: '材料３つレシピ' }, { id: 8, name: '時短レシピ' }, { id: 9, name: '熱中症予防レシピ' },
    { id: 10, name: '家族大好きレシピ' }, { id: 11, name: '冷めても美味しい弁当レシピ' }, { id: 12, name: '子供が大好きおやつレシピ' },
    { id: 13, name: 'その他' }
    ]

  include ActiveHash::Associations
  has_many :recipes
end
