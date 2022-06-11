class Pray < ApplicationRecord
  paginates_per 10
  
  belongs_to :temple
  belongs_to :buddha
  belongs_to :believer

  has_many :pray_requests, dependent: :destroy
  has_many :pray_donations, dependent: :nullify

  default_scope {order(created_at: :desc)}

  accepts_nested_attributes_for :pray_requests, reject_if: proc { |attributes| attributes['request'].blank? }
  accepts_nested_attributes_for :pray_donations, reject_if: proc { |attributes| attributes['donation'].blank? }, allow_destroy: true

end
