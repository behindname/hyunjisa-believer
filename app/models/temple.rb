class Temple < ApplicationRecord
  has_many :believers
  has_many :users
  has_many :prays
  has_many :offerings
end
