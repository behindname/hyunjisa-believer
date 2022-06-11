class Offering < ApplicationRecord
  paginates_per 10
  belongs_to :temple
  belongs_to :buddha
  belongs_to :believer
end
