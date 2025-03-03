class CreateHistoriques < ActiveRecord::Migration[7.2]
  def change
    create_table :historiques do |t|
      t.integer :aircraft_id
      t.integer :user_id
      t.string :action
      t.datetime :timestamp
      t.text :details

      t.timestamps
    end

    add_foreign_key :historiques, :aircrafts
    add_foreign_key :historiques, :users
    add_index :historiques, :aircraft_id
    add_index :historiques, :user_id
  end
end
