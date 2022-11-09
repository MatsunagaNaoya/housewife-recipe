class CookingTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, { id: 2, name: '時短' }, { id: 3, name: 'じっくり' },
    { id: 4, name: '5分以内' }, { id: 5, name: '5分〜10分' }, { id: 6, name: '10分〜15分' },
    { id: 7, name: '15分〜20分' }, { id: 8, name: '20分〜25分' }, { id: 9, name: '25分〜30分' },
    { id: 10, name: '30分以上' }, { id: 11, name: '1時間以上' }, { id: 12, name: '３時間以上' },
    { id: 13, name: '6時間以上' }, { id: 14, name: '半日' }, { id: 15, name: '1日' },
    { id: 16, name: 'その他' }

  ]

  include ActiveHash::Associations
  has_many :recipes
end
