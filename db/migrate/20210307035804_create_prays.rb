class CreatePrays < ActiveRecord::Migration[6.0]
  def change
    create_table :prays do |t|
      t.references :temple, null: false, foreign_key: true
      t.references :buddha, null: false, foreign_key: true
      t.references :believer, null: false, foreign_key: true
      t.string :donator
      t.string :prayerRelation
      t.string :prayerName
      t.string :prayerBirthyear
      t.string :prayerAddress
      t.string :prayerPhone
      t.date :startDay
      t.date :finishDay
      t.date :fullPayDay
      t.boolean :isPrayFinished
      t.boolean :isFinishConfirmed
      t.text :remarks

      t.timestamps
    end
  end
end
