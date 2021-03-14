class CreateBuddhas < ActiveRecord::Migration[6.0]
  def change
    create_table :buddhas do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
