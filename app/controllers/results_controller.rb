# -*- encoding : utf-8 -*-
class ResultsController < ApplicationController
  
  respond_to :html
  before_filter :all_deny
  before_filter :time_work
  before_filter :check_fired
  
  def index
    @title = "Search"
    @search = Subject.search(params[:search])
    if params[:search]
      @subjects = @search.page(params[:page]).per(page_paginate)
      if @subjects.size == 0
        flash.now[:alert] = "Nothing found"
      end
      respond_with(@subjects)
    end
  end
  
  private
  
    def page_paginate
      if Paginator.find_by_resource("search")
        Paginator.find_by_resource("search").paginate
      else
        25
      end
    end
    
end
