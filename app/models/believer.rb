class Believer < ApplicationRecord
  include Memberable
  include ProfileUrl

  belongs_to :temple, optional: true
  
end
