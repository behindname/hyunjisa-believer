class User < ApplicationRecord
  include Memberable
  include ProfileUrl
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  belongs_to :temple, optional: true

  # 미허가자, 스태프, 주지스님, 총괄관리자
  enum access_level: [:unauthorized, :staff, :monk, :master]


end
