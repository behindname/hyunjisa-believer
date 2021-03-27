class Family < ApplicationRecord
  has_many :believers
  has_many :family_members

  accepts_nested_attributes_for :family_members, reject_if: :all_blank, allow_destroy: true

end
