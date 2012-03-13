# -*- encoding : utf-8 -*-
class HelpController < ApplicationController
  
  before_filter :all_deny
  respond_to :html
  
  def index
    @title = "Справка"
  end
  
  def search
    @title = "Справка | Поиск"
  end
  
  def customers
    @title = "Справка | Клиенты"
  end
  
end
