class CreateAirports < ActiveRecord::Migration[7.2]
  def change
    create_table :airports do |t|
      t.string :ident
      t.string :airport_type
      t.string :name
      t.float :latitude_deg
      t.float :longitude_deg
      t.integer :elevation_ft
      t.string :continent
      t.string :iso_country
      t.string :region_name
      t.string :iso_region
      t.string :local_region
      t.string :municipality
      t.boolean :scheduled_service
      t.string :gps_code
      t.string :iata_code
      t.string :local_code
      t.string :home_link
      t.string :wikipedia_link
      t.string :keywords

      t.timestamps
    end
  end
end
