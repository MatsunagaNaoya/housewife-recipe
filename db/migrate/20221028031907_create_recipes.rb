class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.references  :user,            null: false, foreign_key: true
      t.string      :name,            null: false
      t.text        :info,            null: false
      t.integer     :category_id,     null: false
      t.integer     :cooking_time_id, null: false
      t.timestamps
    end
  end
end
