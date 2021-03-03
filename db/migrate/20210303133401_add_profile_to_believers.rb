class AddProfileToBelievers < ActiveRecord::Migration[6.0]
  def change
    add_column :believers, :profile, :string
  end
end
