#encoding: UTF-8

class TransactionsController < ApplicationController
  
  respond_to :html
  
  def index
    @transactions = Transaction.all
    @title = "Сделки"
  end
  
  def new
    @transaction = Transaction.new
    respond_with @transaction
    @title = "Добавление сделки"
  end
  
  def show
    @transaction = Transaction.find(params[:id])
    respond_with @transaction
    @title = @transaction.name
  end
  
  def edit
    @transaction = Transaction.find(params[:id])
    @title = "Редактирование сделки"
  end
  
  def create
    @transaction = Transaction.new(params[:transaction])
    if @transaction.save
      flash[:notice] = "Сделка успешно добавлена"
      redirect_to transactions_path
    else
      render 'new'
    end
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
  
end
