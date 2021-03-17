class CreatePrayRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :pray_requests do |t|
      t.references :pray, null: false, foreign_key: true
      t.date :requestDay
      t.text :request
      t.string :remarks

      t.timestamps
    end
  end
end
