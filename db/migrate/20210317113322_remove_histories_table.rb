class RemoveHistoriesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :pray_donation_histories
    drop_table :pray_request_histories
  end
end
