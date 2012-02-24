# encoding:utf-8
class UsersController < ApplicationController
  before_filter :all_deny 
  respond_to :html
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully"
      respond_with(@user, :location => users_path)
    else
      render 'new'      
    end    
  end
  
  def index
    
  end
  
  def show
  end
  
end
