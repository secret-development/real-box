#encoding: UTF-8
class UsersController < ApplicationController
  respond_to :html
  before_filter :accessible_roles, :only => [:new, :edit, :show, :update, :create] 
  before_filter :get_user, :only => [:index, :new, :edit]
  load_and_authorize_resource :only => [:show, :edit, :new, :destroy, :update] 
  
  def index
    @users = User.accessible_by(current_ability, :index)
    
  end
  def new
    
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      respond_with @user
    else
      render 'new'
    end    
  end
  
end
