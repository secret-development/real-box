# -*- encoding : utf-8 -*-

class PotentialsController < ApplicationController
  respond_to :html  
  before_filter :all_deny 
  before_filter :time_work
  helper_method :sort_column, :sort_direction
  
  def index
    @potentials = Customer.potentials.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(20)
    @title = "Потенциальные клиенты"
  end
  
  def destroy
    @potentials = Customer.find(params[:id])
    @potentials.destroy
    flash[:notice] = "Клиент успешно удален"
    redirect_to @potentials    
  end
  
  private
  
  def sort_column
    Customer.column_names.include?(params[:sort]) ? params[:sort] : "lastname"    
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"    
  end
  
end
