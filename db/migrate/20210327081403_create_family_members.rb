class CreateFamilyMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :family_members do |t|
      t.references :family, foreign_key: true
      t.string :relation
      t.string :name
      t.date :birthday
      t.string :ganzhi
      t.text :remarks

      t.timestamps
    end
  end
end
