# -*- encoding : utf-8 -*-
class ResidentsController < ApplicationController
  
  respond_to :html
  before_filter :all_deny
  before_filter :settings_deny
  load_and_authorize_resource
  
  def index
    @title = "Apartment Complexes"
    @cities = City.all
    respond_with(@cities)
  end
  
  def edit
    @resident = Resident.find(params[:id])
    @title = "Editing"
    respond_with(@resident)
  end
  
  def update
    @resident = Resident.find(params[:id])
     if @resident.update_attributes(params[:resident])
       flash[:notice] = "Apartment Complex successfully updated"
       respond_with(@resident, :location => residents_path)
     else
       render 'edit'
     end
  end
  
  def destroy
    @resident = Resident.find(params[:id])
    @resident.destroy
    flash[:notice] = "Apartment Complex successfully removed"
    redirect_to residents_path
  end
  
end
