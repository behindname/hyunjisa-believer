class Believer < ApplicationRecord
  include Memberable

  belongs_to :temple, optional: true
  
end
