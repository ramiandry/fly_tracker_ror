class CreateAircraft < ActiveRecord::Migration[7.2]
  def change
    create_table :aircrafts do |t|
      t.string :icao24
      t.string :acars
      t.string :adsb
      t.string :built
      t.string :categoryDescription
      t.string :country
      t.string :engines
      t.string :firstFlightDate
      t.string :firstSeen
      t.string :icaoAircraftClass
      t.string :lineNumber
      t.string :manufacturerIcao
      t.string :manufacturerName
      t.string :model
      t.string :modes
      t.string :nextReg
      t.string :notes
      t.string :operator
      t.string :operatorCallsign
      t.string :operatorIata
      t.string :operatorIcao
      t.string :owner
      t.string :prevReg
      t.string :regUntil
      t.boolean :registered
      t.string :registration
      t.string :selCal
      t.string :serialNumber
      t.string :status
      t.string :typecode
      t.string :vdl

      t.timestamps
    end
  end
end
