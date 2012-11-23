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
    if params[:objects] == "Customers" and params[:period]
      Report.select_period(params[:period])
      render "customers_chart"
    elsif params[:objects] == "Objects" and params[:period]
      Report.select_period(params[:period])
      render "subjects_chart"    
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
      Report.select_period(params[:period])
      render "finance_chart"       
    end           
  end
end
