class System < ApplicationRecord
  has_and_belongs_to_many :themes, dependent: :destroy
end
