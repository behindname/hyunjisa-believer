class Believer < ApplicationRecord
  belongs_to :temple, optional: true
end
