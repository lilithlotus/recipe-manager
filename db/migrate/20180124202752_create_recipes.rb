class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.string :cook_time
      t.string :servings
      t.text :instructions
      t.integer :user_id
      t.integer :meal_id
    end
  end
end
