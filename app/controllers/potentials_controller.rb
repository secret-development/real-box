# encoding: UTF-8
class PotentialsController < ApplicationController
  respond_to :html;
  
  def index
    @potentials = Customer.potentials.all
    @title = "Потенциальные клиенты"
  end
  
  def destroy
    @potentials = Customer.find(params[:id])
    @potentials.destroy
    flash[:notice] = "Клиент успешно удален"
    redirect_to @potentials    
  end
end
