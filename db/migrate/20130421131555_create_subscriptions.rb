class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :phone_number
      t.boolean :is_active, :default => false

      t.timestamps
    end

    add_index :subscriptions, :is_active
  end
end
