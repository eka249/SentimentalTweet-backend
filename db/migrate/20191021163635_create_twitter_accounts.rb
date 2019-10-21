class CreateTwitterAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :twitter_accounts do |t|
      t.string :name
      t.string :twitter_account

      t.timestamps
    end
  end
end
