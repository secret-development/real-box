# encoding: UTF-8
class SocialStatusesController < ApplicationController
  respond_to :html
  
  def new
    @socialstatus = SocialStatus.new
    @title = "Добавление социального статуса"
    respond_with @socialstatus    
  end
  
  def index
    @socialstatuses = SocialStatus.all
    @title = "Социальные статусы"
    respond_with @socialstatuses    
  end
  
  def edit
    @socialstatus = SocialStatus.find(params[:id])
    @title = "Редактирование социального статуса"
    respond_with @socialstatus    
  end
  
  def create
    @socialstatus = SocialStatus.create
    if @socialstatus.save
      flash[:notice] = "Социальный статус создан"
      respond_with(@socialstatus, :location => social_statuses_path)
    else
      flash[:alert] = "Социальный статус не создан"
      respond_with(@socialstatus, :location => social_statuses_path)      
    end
    
  end
end
