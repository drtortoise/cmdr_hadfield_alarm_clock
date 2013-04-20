class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :body
      t.datetime :timestamp
      t.integer :uid
      t.boolean :was_sent

      t.timestamps
    end
  end
end
