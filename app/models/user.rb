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


   def admin?
     roles.where(name: "admin").exists?
   end

end
