#encoding: UTF-8
class UsersController < ApplicationController
  
  
  
#  def after_sign_up_path_for(resource)
#    '/users/edit'
#  end
  
  def index
    @users = User.accessible_by(current_ability, :index)
    respond_to do |f|
      f.html
      f.json {render :json => @users}      
    end       
  end
    

  
  
end
