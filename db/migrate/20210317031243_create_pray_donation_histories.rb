class CreatePrayDonationHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :pray_donation_histories do |t|
      t.references :pray, null: false, foreign_key: true
      t.date :donateDay
      t.string :remarks

      t.timestamps
    end
  end
end
