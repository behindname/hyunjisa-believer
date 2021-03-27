class AddFamilyToBelievers < ActiveRecord::Migration[6.0]
  def change
    add_reference :believers, :family, foreign_key: true
  end
end
