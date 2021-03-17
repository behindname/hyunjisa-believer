class CreatePrayRequestHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :pray_request_histories do |t|
      t.references :pray, null: false, foreign_key: true
      t.date :requestDay
      t.text :request

      t.timestamps
    end
  end
end
