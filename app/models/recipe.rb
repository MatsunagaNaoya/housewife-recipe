class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :cooking_time
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  with_options presence: true do
    validates :image, :name, :info
    validates :category_id, :cooking_time_id, numericality: { other_than: 1, message: "can't to in valid" }
  end
end
