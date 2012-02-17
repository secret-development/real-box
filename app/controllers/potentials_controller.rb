# encoding: UTF-8
class PotentialsController < ApplicationController
  respond_to :html
  helper_method :sort_column, :sort_direction
  
  def index
    @potentials = Customer.potentials.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(7)
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
