class CreateFavoriteAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_accounts do |t|
      t.references :user, foreign_key: true
      t.references :twitter_account, foreign_key: true

      t.timestamps
    end
  end
end
