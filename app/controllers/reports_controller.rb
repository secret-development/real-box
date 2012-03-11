# -*- encoding : utf-8 -*-
class ReportsController < ApplicationController
  respond_to :html
  layout 'report'
  load_and_authorize_resource
  def index
    if params[:month] == "Неделя"
      render  "weeks"
    elsif params[:month] == "Месяц"
      render  "month"        
    end  
  end
  
  def show
    
  end
  
  def activ      
  end
  
  def finance    
  end
end
