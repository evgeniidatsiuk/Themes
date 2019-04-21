class WindowsTenTheme < ApplicationRecord
  belongs_to :user
  belongs_to :admin_user
  belongs_to :system

  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON # If you use SQLite, add this line.

end
