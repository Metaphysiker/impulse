class User < ApplicationRecord
      has_one_attached :cover
has_many :user_messages
has_many :messages, :through => :user_messages

has_many :skills

has_many :user_roles
has_many :roles, :through => :user_roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.showable_attribute_names
    ["email", "name", "address", "phone", "localized_birth_day",
       "recruitment_consultant", "disposal_period", "personal_number", "unemployment_insurance_number"]
  end

  def self.showable_attribute_names_for_cv
    ["email", "name", "address", "phone", "localized_birth_day"]
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def plz_with_location
    "#{self.plz} #{self.location}"
  end

  def address
    "#{self.plz_with_location} \n #{self.street}"
  end

  def disposal_period
    "#{I18n.l(self.disposal_period_start) unless self.disposal_period_start.blank?} - #{I18n.l(self.disposal_period_end) unless self.disposal_period_end.blank?}"
  end

  def localized_birth_day
    "#{I18n.l(self.birth_day)}"
  end

   def admin?
     roles.where(name: "admin").exists?
   end

end
