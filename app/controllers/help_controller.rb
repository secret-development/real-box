# -*- encoding : utf-8 -*-
class HelpController < ApplicationController

  respond_to :html
  before_filter :all_deny
  before_filter :time_work  
  before_filter :check_fired
  # def index
  #   @title = "Справка"
  # end
  
  def search
    @title = "Help | Search"
  end
  
  def customers
    @title = "Help | Customers"
  end
  
  def subjects
    @title = "Help | Objects"
  end
  
  def users
    @title = "Help | Staff"
  end
  
  def tasks
    @title = "Help | Tasks"
  end
  
  def transactions
    @title = "Help | Dealings"
  end
  
  def report
    @title = "Help | Reports"
  end
  
  def danger
    @title = "Справка | Важно"
  end
  
end
