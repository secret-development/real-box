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
    if params[:objects] == "Клиенты" and params[:period]
      Report.select_period(params[:period])
      render "customers_chart"
      # case params[:period]
      # when "Неделя"
      #   render "customers_week"
      # when "Месяц"
      #   render "customers_month"
      # when "Квартал"
      #   render "customers_quarter"
      # when "Год"
      #   render "customers_year"        
      # end
    elsif params[:objects] == "Объекты" and params[:period]
      Report.select_period(params[:period])
      render "subjects_chart"
      # case params[:period]
      # when "Неделя"
      #   render "subjects_week"
      # when "Месяц"
      #   render "subjects_month"
      # when "Квартал"
      #   render "subjects_quarter"
      # when "Год"
      #   render "subjects_year"
      # end      
    end
  end
  
  def activ
    if params[:period]
      Report.find_user(params[:agent][:agent_id])
      Report.select_period(params[:period]) 
      render "activ_chart"
    end      
  end
  
  def finance
    if params[:period]
      Report.select_period(params[:period]) #if params[:period]
      render "finance_chart"  
    end
    # case params[:period]
    # when "Неделя"
    #   render "weeks"
    # when "Месяц"
    #   render "month"      
    # when "Квартал"
    #   render "quarter"
    # when "Год"
    #   render "year"
    # end           
  end
end
