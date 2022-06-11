class Believer < ApplicationRecord
  include Memberable
  include ProfileUrl
  paginates_per 10

  default_scope { order(created_at: :desc) }

  belongs_to :temple, optional: true
  belongs_to :family, optional: true
  
  has_many :prays
  has_many :offerings
  
end
