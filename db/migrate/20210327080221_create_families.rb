class CreateFamilies < ActiveRecord::Migration[6.0]
  def change
    create_table :families do |t|
      t.integer :main_believer_id
      t.string :name

      t.timestamps
    end
  end
end
