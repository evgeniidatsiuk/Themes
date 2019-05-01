class Theme < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :systems
  has_many :tags, as: :object
  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON # If you use SQLite, add this line.

  def all_tags
    tags.map { |tag| Category.find(tag.category_id) }.map(&:name).join(', ')
  end
end
