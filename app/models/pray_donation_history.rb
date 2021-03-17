class PrayDonationHistory < ApplicationRecord
  belongs_to :pray, optional: true
end
