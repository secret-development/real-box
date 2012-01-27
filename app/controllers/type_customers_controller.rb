# encoding: UTF-8
class TypeCustomersController < ApplicationController
  respond_to :html
  
  def index
    @typecustomers = TypeCustomer.all
    @title = "Типы клиентов"
    respond_with(@typecustomers)    
  end
  
  def new
    @typecustomer = TypeCustomer.new
    @title = "Создание типа клиента"
    respond_with(@typecustomer)    
  end
  
  def edit
    @typecustomer = TypeCustomer.find(params[:id])
    respond_with(@typecustomer)    
  end
  
  def create
    @typecustomer = TypeCustomer.new(params[:type_customer])
    if @typecustomer.save
      flash[:notice] = "Тип клиента добавлен!"
      respond_with(@typecustomer, :location => type_customers_path)
    else
      render 'new'      
    end      
  end
  
  def update
    @typecustomer = TypeCustomer.find(params[:id])
    if @typecustomer.update_attributes(params[:type_customer])
      flash[:notice] = "Тип клиента обновлен!"
      respond_with(@typecustomer, :location => type_customers_path)
    else  
      render 'edit'      
    end      
  end
  
  def destroy
    @typecustomer = TypeCustomer.find(params[:id])
    @typecustomer.destroy
    flash[:notice] = "Тип клиента удален!"
    redirect_to(@typecustomer, :location => type_customers_path)        
  end
end
