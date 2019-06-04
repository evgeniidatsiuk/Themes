class Theme < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :systems, dependent: :destroy
  has_many :tags, as: :object, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON # If you use SQLite, add this line.

  validates :name, presence: true
  validates :description, presence: true
  validates :download, presence: true


  def all_tags
    tags.map { |tag| Category.find(tag.category_id) }.map(&:name).join(', ')
  end

end
