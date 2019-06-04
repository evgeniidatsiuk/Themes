class Dislike < ApplicationRecord
  belongs_to :object, polymorphic: true
end
