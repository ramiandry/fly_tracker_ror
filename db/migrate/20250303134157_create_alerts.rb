class CreateAlerts < ActiveRecord::Migration[7.2]
  def change
    create_table :alerts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :flight, null: false, foreign_key: true
      t.string :alert_type
      t.text :message
      t.boolean :read, default: false
      t.boolean :sent, default: false

      t.timestamps
    end
  end
end
