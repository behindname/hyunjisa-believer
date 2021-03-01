class Temple < ApplicationRecord
  has_many :believers
  has_many :users
end
