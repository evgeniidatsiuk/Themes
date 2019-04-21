class WindowsEightTheme < ApplicationRecord
  belongs_to :user
  belongs_to :admin_user
  belongs_to :system
  has_many :tags, as: :object
  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON # If you use SQLite, add this line.

  def all_tags
  tags.map { |tag| System.find(tag.system_id) }.map(&:name).join(', ')
end

end
