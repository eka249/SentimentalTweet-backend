class CreateTweetAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :tweet_accounts do |t|
      t.references :celeb, foreign_key: true
      t.references :tweet, foreign_key: true

      t.timestamps
    end
  end
end
