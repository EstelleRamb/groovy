class CreateMyExchanges < ActiveRecord::Migration[7.0]
  def change
    create_table :my_exchanges do |t|
      t.integer :status
      t.integer :requested_vinyl_id
      t.integer :user_id
      t.integer :offered_vinyl_id

      t.timestamps
    end
  end
end
