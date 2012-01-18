# encoding: UTF-8
class RcustomersController < ApplicationController
  respond_to :html
  
  def index
    
  end
  
  def new
    @rcustomer = Rcustomer.new
    respond_with @rcustomer    
  end
  
  def create
    @rcustomer = Rcustomer.create(params[:rcustomer])
    if @rcustomer.save
      flash[:notice] = "Клиент успешно сохранен!"
      respond_with @rcustomer   
    else
      render 'new'      
    end    
  end
  
  def update
    @rcustomer = Rcustomer.find(params[:id])
    if @rcustomer.update_attributes(params[:rcustomer])
      flash[:notice] = "Клиент успешно обновлен"
      respond_with @rcustomer   
    else
      render 'edit'        
    end    
  end
  
  def destroy
    @rcustomer = Rcustomer.find(params[:id])
    @rcustomer.destroy
    flash[:notice] = "Клиент успешно удален"
  end
end
