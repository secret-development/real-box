# encoding:utf-8
class User < ActiveRecord::Base
  # associations:
  #has_and_belongs_to_many :roles
  has_many :tasks, :dependent => :destroy
  

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role

  
#  def accessible_roles
#    @accessible_roles = User.role.    
#  end
end

