#encoding: UTF-8
class User::RegistrationsController < Devise::RegistrationsController
  before_filter :check_permissions, :only => [:new, :create] 
  
  def check_permissions
    authorize! :create, resource
  end


end
