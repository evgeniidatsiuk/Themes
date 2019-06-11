class Theme < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :systems, dependent: :destroy

  has_many :tags, as: :object,      dependent: :destroy
  has_many :comments,               dependent: :destroy
  has_many :likes, as: :object,     dependent: :destroy
  has_many :dislikes, as: :object,  dependent: :destroy
  has_many :chosens

  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON

  validates :name, presence: true
  validates :description, presence: true
  validates :download, presence: true


  def all_tags
    tags.map { |tag| Category.find(tag.category_id) }.map(&:name).join(', ')
  end

end
