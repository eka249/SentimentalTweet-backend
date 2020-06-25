class CreateFavoriteCelebs < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_celebs do |t|
      t.references :user, foreign_key: true
      t.references :celeb, foreign_key: true

      t.timestamps
    end
  end
end
