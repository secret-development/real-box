# -*- encoding : utf-8 -*-
#encoding: UTF-8

class TransactionsController < ApplicationController
  
  respond_to :html
  before_filter :all_deny
  helper_method :sort_column, :sort_direction
  
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
  
  def index
    @transactions = Transaction.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(10)
    @title = "Сделки"
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
  end
  
  private
  
  def sort_column
    Transaction.column_names.include?(params[:sort]) ? params[:sort] : "name"    
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"    
  end
  
end
