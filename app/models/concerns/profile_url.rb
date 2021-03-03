module ProfileUrl
  extend ActiveSupport::Concern

  included do
    mount_uploader :profile, ProfileUploader
  end

  def profile_path size = :square
    profile? ? profile.url(size) : '/image/profile.png'
  end
end
