class AddIndexToFamilies < ActiveRecord::Migration[6.0]
  def change
    add_index :families, :main_believer_id, unique: true
  end
end