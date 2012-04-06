# -*- encoding : utf-8 -*-

class TransactionsController < ApplicationController

  respond_to :html
  before_filter :all_deny
  before_filter :time_work
  before_filter :check_fired
  
  helper_method :sort_column, :sort_direction
  load_and_authorize_resource
  
  def index
    @transactions = Transaction.joins(:customer).search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(page_paginate)
    @title = "Сделки"
  end
  
  def new
    begin
      @customer = Customer.find(params[:customer_id])
      @transaction = Transaction.new
      @title = "Добавление новой сделки"
      respond_with @transaction
    rescue ActiveRecord::RecordNotFound
      redirect_to(transactions_path, :alert => "Нет привязанного клиента")
    end
  end
  
  def create
    @transaction = Transaction.new(params[:transaction])
    if @transaction.save
      flash[:notice] = "Сделка успешно добавлена"
      respond_with(@transaction)
    else
      render 'new'
    end
  end
  
  def show
    @transaction = Transaction.find(params[:id])
    @title = "Информация о сделке"
    respond_with @transaction
  end
  
  def edit
    @transaction = Transaction.find(params[:id])
    @title = "Редактирование сделки"
  end
  
  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update_attributes(params[:transaction])
      flash[:notice] = "Сделка успешно обновлена"
      redirect_to transactions_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    flash[:notice] = "Сделка успешно удалена"
    redirect_to transactions_path
  end
  
  def add_document
    @transaction = Transaction.find(params[:id])
    @title = "Добавление документов"
  end
  
  private
  
  def sort_column
    Transaction.column_names.include?(params[:sort]) ? params[:sort] : "created_at"    
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"    
  end
  
  def page_paginate
    Paginator.find_by_resource("сделки").paginate
  end
  
end
