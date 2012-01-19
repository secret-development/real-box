# encoding: UTF-8
class CustomersController < ApplicationController
  respond_to :html
  
  def index
    @customers = Customer.all
  end
  
  def new
    @customer = Customer.new
    respond_with @customer    
  end
  
  def create
    @customer = Customer.create(params[:customer])
    if @customer.save
      flash[:notice] = "Клиент успешно сохранен!"
      respond_with(@customer, :location => customers_path)   
    else
      render 'new'      
    end    
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(params[:customer])
      flash[:notice] = "Клиент успешно обновлен"
      respond_with @customer   
    else
      render 'edit'        
    end    
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:notice] = "Клиент успешно удален"
  end
end
