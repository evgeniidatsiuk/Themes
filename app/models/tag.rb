class Tag < ApplicationRecord
  belongs_to :object, polymorphic: true
  belongs_to :system

  def self.all_tags(object, names)
  names = names.split(' ').map { |name| name.strip.downcase }
  names.delete('')
   if names
    names.to_set.map do |name|
      system = System.where(name: name).first_or_create!
      Tag.where(system_id: system.id, object_type: object.class.name, object_id: object.id).first_or_create!
     end
   end
  object.tags.map do |tag|
    tag.destroy unless names.include?(System.find(tag.system_id).name)
   end
 end

end
