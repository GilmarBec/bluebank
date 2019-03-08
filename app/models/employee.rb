class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :trackable,
         :database_authenticatable, :authentication_keys => [:login]

  validates :email, uniqueness: true
  validates :login, uniqueness: true
end
