#encoding: UTF-8
class UsersController < ApplicationController
  #before_filter :check_permissions, :only => [:new, :create] 
  respond_to :html
  before_filter :get_user, :only => [:index,:new,:edit]
  #load_and_authorize_resource :only => [:show,:new,:destroy,:edit,:update]  
  
#  def after_sign_up_path_for(resource)
#    '/users/edit'
#  end
#  def check_permissions
#    authorize! :create, user
#  end
  
  def index
    @users = User.accessible_by(current_ability, :index)
    respond_with @users             
  end
  
  def new
    @user = User.new  
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully"
      respond_with(@user, :location => users_path)
    else
      #render 'devise/registrations/new'  
    end    
  end
  
    
  def get_user
    @current_user = current_user    
  end
  
  
    

  
  
end
