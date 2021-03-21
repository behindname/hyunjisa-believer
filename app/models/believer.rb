class Believer < ApplicationRecord
  include Memberable
  include ProfileUrl

  default_scope { order(created_at: :desc) }

  belongs_to :temple, optional: true
  
  has_many :prays
  has_many :offerings
  
end
