class User < ApplicationRecord
  attr_accessor :login
  after_create :create_userparam

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one  :userparam,             dependent: :destroy
  has_many :themes,                dependent: :destroy
  has_many :comments,              dependent: :destroy
  has_many :likes, as: :object,    dependent: :destroy
  has_many :dislikes, as: :object, dependent: :destroy
  has_many :chosens


  acts_as_messageable

  validates :nickname, presence: :true, uniqueness: { case_sensitive: false }
  # validates_format_of :nickname, with: /\A\w+ +\w+\z/, multiline: true

  def create_userparam
    @userparam = Userparam.create(user_id: id, firstname: "user#{id}", lastname: "user#{id}", age: 18)
    @userparam.save
   end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(['lower(nickname) = :value OR lower(email) = :value', { value: login.strip.downcase }]).first
  end

  def self.find_recoverable_or_initialize_with_errors(required_attributes, attributes, error = :invalid)
    (case_insensitive_keys || []).each { |k| attributes[k].try(:downcase!) }

    attributes = attributes.slice(*required_attributes)
    attributes.delete_if { |_key, value| value.blank? }

    if attributes.keys.size == required_attributes.size
      if attributes.key?(:login)
        login = attributes.delete(:login)
        record = find_record(login)
      else
        record = where(attributes).first
      end
    end
  end

  def self.find_record(login)
    where(['username = :value OR email = :value', { value: login }]).first
  end

  def mailboxer_email(object)
    nil
  end

end
