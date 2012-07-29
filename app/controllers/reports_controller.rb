# -*- encoding : utf-8 -*-
class ReportsController < ApplicationController

  respond_to :html
  before_filter :all_deny
  before_filter :settings_deny
  layout 'report'
  load_and_authorize_resource
  
  def index
    redirect_to finance_reports_path
  end
  
  def show
  end
  
  def general
    if params[:objects] == "Клиенты"
      case params[:period]
      when "Неделя"
        render "customers_week"
      when "Месяц"
        render "customers_month"
      when "Квартал"
        render "customers_quarter"
      when "Год"
        render "customers_year"        
      end
    elsif params[:objects] == "Объекты"
      case params[:period]
      when "Неделя"
        render "subjects_week"
      when "Месяц"
        render "subjects_month"
      when "Квартал"
        render "subjects_quarter"
      when "Год"
        render "subjects_year"
      end      
    end
  end
  
  def activ
    if params[:period]
      Report.find_user(params[:agent][:agent_id])
      Report.select_period(params[:period]) 
      render "activ_week"
    end      
  end
  
  def finance
    case params[:period]
    when "Неделя"
      render "weeks"
    when "Месяц"
      render "month"      
    when "Квартал"
      render "quarter"
    when "Год"
      render "year"
    end           
  end
end
