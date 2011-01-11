class Account < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :confirmable, :lockable

  # associations
  has_many :servers

  # whitelisted attributes for mass-assignment
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
