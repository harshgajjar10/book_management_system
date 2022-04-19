class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  ##Favourite book
  acts_as_favoritor

  ##For assign a role
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ## Callbacks
  after_create :assign_default_role

  def assign_default_role
    if self.email.eql?('admin@bookmanagement.com')
      self.add_role(:admin) if self.roles.blank?
    else
      self.add_role(:user) if self.roles.blank?
    end
  end
end
