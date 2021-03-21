class CreateOfferings < ActiveRecord::Migration[6.0]
  def change
    create_table :offerings do |t|
      t.references :temple, null: false, foreign_key: true
      t.references :buddha, null: false, foreign_key: true
      t.references :believer, null: false, foreign_key: true
      t.string :donator
      t.string :offerorRelation
      t.string :offerorName
      t.string :offerorBirthyear
      t.string :offerorAddress
      t.string :offerorPhone
      t.date :offerDay
      t.text :request
      t.text :remarks

      t.timestamps
    end
  end
end
