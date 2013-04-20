class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :body
      t.datetime :timestamp
      t.string :uid
      t.boolean :was_sent, :default => false

      t.timestamps
    end
    add_index :tweets, :timestamp
    add_index :tweets, :was_sent
  end
end
