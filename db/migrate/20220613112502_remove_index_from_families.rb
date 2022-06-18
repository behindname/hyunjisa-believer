class RemoveIndexFromFamilies < ActiveRecord::Migration[6.0]
  def change
    remove_index :families, :main_believer_id
  end
end
