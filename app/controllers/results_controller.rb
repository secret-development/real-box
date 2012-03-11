# -*- encoding : utf-8 -*-
class ResultsController < ApplicationController
  before_filter :all_deny
  
  def index
    @title = "Поиск"
    @search = Subject.search(params[:search])
    @subjects = @search.all
  end
  
end
