# -*- encoding : utf-8 -*-
class ReportsController < ApplicationController
  respond_to :html
  layout 'report'
  def index
    if params[:month] == "Неделя"
      flash[:notice] = "Диграмма за неделю!"
      render  "weeks"
    elsif params[:month] == "Месяц"
      flash[:notice] = "Диаграмм за месяц!"
      render  "month"        
    end  
  end
  
  def show
    
  end
  
  def activ
        
  end
end
