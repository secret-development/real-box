# -*- encoding : utf-8 -*-
class ReportsController < ApplicationController
  respond_to :html
  layout 'report'
  load_and_authorize_resource
  def index
    
  end
  
  def show
    
  end
  
  def activ      
  end
  
  def finance
    if params[:period] == "Неделя"
      render  "weeks"
    elsif params[:period] == "Месяц"
      render  "month"
    elsif params[:period] == "Квартал"
      render "quarter"
    elsif params[:period] == "Год"
      render "year"      
    end     
  end
end
