class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictues do |t|
      t.string :url
      t.string :caption
    end
  end
end
