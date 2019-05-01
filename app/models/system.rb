class System < ApplicationRecord
  has_and_belongs_to_many :theme
has_many :categories

end
