class Offering < ApplicationRecord
  belongs_to :temple
  belongs_to :buddha
  belongs_to :believer
end
