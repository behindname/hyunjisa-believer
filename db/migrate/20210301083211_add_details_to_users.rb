class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :temple, foreign_key: true
    add_column :users, :name, :string
    add_column :users, :addressProvince, :integer
    add_column :users, :addressDetail, :string
    add_column :users, :phone, :string
    add_column :users, :gender, :integer
    add_column :users, :birthday, :date
    add_column :users, :registerday, :date
    add_column :users, :remarks, :text
    add_column :users, :ganzhi, :string
    add_column :users, :dharmaName, :string
  end
end
