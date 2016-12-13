class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :search
      t.string :screen_name
      t.string :text
      t.string :retweet_count
      t.string :favorite_count
      t.string :url
      t.timestamps null: false
    end
  end
end
