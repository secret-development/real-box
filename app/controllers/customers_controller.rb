# encoding: UTF-8
class CustomersController < ApplicationController
  respond_to :html
  helper_method :sort_column, :sort_direction
  #load_and_authorize_resource

  def all
    @customers = Customer.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(7)
  end
  
  def index
    @customers = Customer.real.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(7)#real.page(params[:page]).per(10)
    @title = "Действующие клиенты"
    #@potentials = Customer.potentials.all
  end
  
  def new
    @customer = Customer.new
    respond_with @customer    
  end
  
  def edit
    @customer = Customer.find(params[:id])
    respond_with @customer
    #unauthorized! if cannot? :update, @customer   
  end
  
  def show
    @customer = Customer.find(params[:id])
    respond_with @customer
  end
  
  def create
    @customer = Customer.create(params[:customer])
    if @customer.save
      flash[:notice] = "Клиент успешно сохранен!"
      respond_with(@customer)#, :location => customers_path)   
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
    redirect_to @customer
    unauthorized! if cannot? :destroy, @customer 
  end
  
  private
  
  def sort_column
    Customer.column_names.include?(params[:sort]) ? params[:sort] : "lastname"    
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"    
  end
end
