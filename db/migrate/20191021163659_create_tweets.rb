class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.text :content
      t.float :sentiment

      t.timestamps
    end
  end
end
