class Pray < ApplicationRecord
  belongs_to :temple
  belongs_to :buddha
  belongs_to :believer

  has_many :pray_request_histories, dependent: :destroy
  has_many :pray_donation_histories, dependent: :nullify
end
