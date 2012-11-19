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
    if params[:period] == "Week" and params[:objects] == "Customers"
      render "customers_week"
    elsif params[:period] == "Month" and params[:objects] == "Customers"
      render "customers_month"
    elsif params[:period] == "Quarter" and params[:objects] == "Customers"
      render "customers_quarter"
    elsif params[:period] == "Year" and params[:objects] == "Customers"
      render "customers_year"
    elsif params[:period] == "Week" and params[:objects] == "Objects"
      render "subjects_week"
    elsif params[:period] == "Month" and params[:objects] == "Objects"
      render "subjects_month"
    elsif params[:period] == "Quarter" and params[:objects] == "Objects"
      render "subjects_quarter"
    elsif params[:period] == "Year" and params[:objects] == "Objects"
      render "subjects_year"
    end
  end
  
  def activ
    if params[:period] == "Week" #and params[:agent] # [:agent_id] == Report.current(:agent_id)
      Report.find_user(params[:agent][:agent_id])
      render "activ_week"
    elsif params[:period] == "Month" #and params[:agent_id]
      Report.find_user(params[:agent][:agent_id])
      render "activ_month"
    elsif params[:period] == "Quarter" #and params[:agent_id]
      Report.find_user(params[:agent][:agent_id])
      render "activ_quarter"
    elsif params[:period] == "Year" #and params[:agent_id]
      Report.find_user(params[:agent][:agent_id])
      render "activ_year"                      
    end            
  end
  
  def finance
    if params[:period] == "Week"
      render  "weeks"
    elsif params[:period] == "Month"
      render  "month"
    elsif params[:period] == "Quarter"
      render "quarter"
    elsif params[:period] == "Year"
      render "year"      
    end           
  end
end
