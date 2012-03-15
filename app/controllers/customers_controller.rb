# -*- encoding : utf-8 -*-

class CustomersController < ApplicationController
  before_filter :all_deny
  before_filter :time_work
  respond_to :html
  helper_method :sort_column, :sort_direction

  
  def all
    @customers = Customer.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(page_paginate)
    @title = "Все клиенты"
  end
  
  def index
    @customers = Customer.real.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(page_paginate)#real.page(params[:page]).per(10)
    @title = "Действующие клиенты"
    #@potentials = Customer.potentials.all
  end
  
  def new
    @customer = Customer.new
    @title = "Добавление клиента"
    respond_with @customer 
  end
  
  def edit
    @customer = Customer.find(params[:id])
    @title = "Редактирование клиента"
    respond_with @customer
    #unauthorized! if cannot? :update, @customer   
  end
  
  def show
    @customer = Customer.find(params[:id])
    @subjects = @customer.subjects
    @title = @customer.fullname
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
  end
  
  def lastcallcustomer
    customer = Customer.find(params[:id])
    customer.update_attribute(:lastcall, Time.current)
    @lastcall = customer.lastcall.strftime('%d.%m.%Y %H:%M:%S').to_json
    respond_to do |format|
      format.json { render :json => @lastcall}
    end
  end
  
  private
  
  def sort_column
    Customer.column_names.include?(params[:sort]) ? params[:sort] : "lastname"    
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"    
  end
  
  def page_paginate
    20
  end

  
end
