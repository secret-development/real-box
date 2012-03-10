# -*- encoding : utf-8 -*-
class ReportController < ApplicationController
  
  def index
    if params[:month] == "Неделя"
      flash[:notice] = "Диграмма за неделю!"
      render  "weeks"
    elsif params[:month] == "Месяц"
      flash[:notice] = "Диаграмм за месяц!"
      render  "month"        
    end  
  end
end
