# encoding: UTF-8
class TypeCustomersController < ApplicationController
  respond_to :html
  
  def index    
  end
  
  def new
    @typecustomer = TypeCustomer.new
    @title = "Создание типа клиента"
    respond_with(@typecustomer)    
  end
  
  def edit    
  end
  
  def create
    @typecustomer = TypeCustomer.new(params[:type_customer])
    if @typecustomer.save
      flash[:notice] = "Тип клиента добавлен!"
      respond_with(@typecustomer, :location => type_customer_path)
    else
      render 'new'      
    end      
  end
  
  def update
        
  end
  
  def destroy
        
  end
end
