# -*- encoding : utf-8 -*-
class PagesController < ApplicationController
  before_filter :all_deny 
  def index
    @title = "Главная"
  end
end
