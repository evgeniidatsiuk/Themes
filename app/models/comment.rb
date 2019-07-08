class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :theme

  has_many :likes, as: :object,    dependent: :destroy
  has_many :dislikes, as: :object, dependent: :destroy

end
