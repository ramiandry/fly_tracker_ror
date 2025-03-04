class CreateFlights < ActiveRecord::Migration[7.2]
  def change
    create_table :flights do |t|
      t.string :flight_code
      t.datetime :departure_time
      t.datetime :arrival_time
      t.string :origin_airport_id
      t.string :destination_airport_id
      t.string :status

      t.timestamps
    end
  end
end
