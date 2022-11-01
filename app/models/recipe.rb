class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  

  with_options presence: true do
    validates :image, :name, :info
    validates :category_id, :cooking_time_id, numericality: { other_than: 1, message: "can't to in valid " }
  end
end
