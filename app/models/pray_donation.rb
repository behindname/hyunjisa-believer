class PrayDonation < ApplicationRecord
  default_scope{ order(created_at: :asc)}
  
  belongs_to :pray
end
