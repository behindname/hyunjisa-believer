class Family < ApplicationRecord
  validates :main_believer_id, uniqueness: true
  has_many :believers, dependent: :nullify
  has_many :family_members, dependent: :destroy

  accepts_nested_attributes_for :family_members, reject_if: :all_blank, allow_destroy: true

end
