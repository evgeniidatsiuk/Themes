class Userparam < ApplicationRecord
  belongs_to :user

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '50x50' }, default_url: '/assets/missing.png'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage/.*\z}

  def username
    username = user.nickname
    username ||= user.email.split('@').first
  end
end
