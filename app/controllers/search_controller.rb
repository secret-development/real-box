# -*- encoding : utf-8 -*-
class SearchController < ApplicationController
  before_filter :all_deny
  
  def index
    @title = "Поиск"
    @search = Subject.search(params[:search])
    @subjects = @search.all
  end
  
end
