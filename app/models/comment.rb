class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :object, polymorphic: true

  #validates :text, presence:true
end
