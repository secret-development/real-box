# -*- encoding : utf-8 -*-
#encoding: UTF-8

class TransactionsController < ApplicationController
  
  respond_to :html
  before_filter :all_deny
  helper_method :sort_column, :sort_direction
  load_and_authorize_resource :except => [:new, :create, :update]
  
  def index
    @transactions = Transaction.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(10)
    @title = "Сделки"
    
#    @h = LazyHighCharts::HighChart.new('graph') do |f|
#      f.chart({:defaultSeriesType => 'area'})
#      f.title(:text => 'Сделки')
#      #f.x_Axis([:type => 'datetime'])
#      f.x_Axis([:dateTimeLabelFormats => {:month => '%b' }])
#      #f.y_Axis([:title => {:text => 'Status'}, :min => 0.6])
#      #f.plot_options({:area => {:line_width => 10, :fillColor => {:lineGradient => [0, 10, 0, 300]}}})
#      f.options[:legend][:layout] = "horizontal"   
#      f.series(:name => current_user.lastname, :data => [1 ,4 , 6, 6, 4])
#      #f.options[:xAxis][:categories] = ["uno" ,"dos" , "tres" , "cuatro"]
#    end
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
    Transaction.column_names.include?(params[:sort]) ? params[:sort] : "name"    
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"    
  end
  
end
