class PrayRequest < ApplicationRecord
  default_scope{ order(created_at: :desc)}

  belongs_to :pray
end
