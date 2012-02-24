# encoding:utf-8
class UsersController < ApplicationController
  before_filter :access
  respond_to :html
  load_and_authorize_resource
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully"
      respond_with @user
    else
      render 'new'      
    end    
  end
  
end
