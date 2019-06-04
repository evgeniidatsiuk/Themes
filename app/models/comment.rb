class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :theme
#  has_many :comments, dependent: :destroy need polymorphic
  has_many :likes, as: :object, dependent: :destroy
  has_many :dislikes, as: :object, dependent: :destroy

  #validates :text, presence:true
end
