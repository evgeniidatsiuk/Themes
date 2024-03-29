class AdminUser < ApplicationRecord
  attr_accessor :login

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(['lower(email) = :value OR lower(email) = :value',
      { value: login.strip.downcase }]).first
  end
end
