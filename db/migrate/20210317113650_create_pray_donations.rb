class CreatePrayDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :pray_donations do |t|
      t.references :pray, null: false, foreign_key: true
      t.date :donateDay
      t.integer :donation
      t.string :remarks

      t.timestamps
    end
  end
end
