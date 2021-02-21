class CreateBelievers < ActiveRecord::Migration[6.0]
  def change
    create_table :believers do |t|
      t.references :temple, foreign_key: true
      t.string :name
      t.integer :addressProvince
      t.string :addressDetail
      t.string :phone
      t.integer :gender
      t.date :birthday
      t.date :registerday
      t.text :remarks
      t.string :ganzhi
      t.string :dharmaName
      t.string :email

      t.timestamps
    end
  end
end
