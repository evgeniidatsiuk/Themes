class Userparam < ApplicationRecord
  belongs_to :user

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '50x50' }, default_url: '/assets/missing.png'
  validates_attachment_content_type :avatar, content_type: ['image/jpeg', 'image/gif', 'image/png']

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :age, presence: true, inclusion: { in: 1..125, message: 'must be 18 or older' }

  def username
    username = user.nickname
    username ||= user.email.split('@').first
  end

  def chosens
    user.chosens
  end
end
