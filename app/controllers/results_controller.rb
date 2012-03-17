# -*- encoding : utf-8 -*-
class ResultsController < ApplicationController
  
  respond_to :html
  before_filter :all_deny
  before_filter :time_work
  
  
  def index
    @title = "Поиск"
    @search = Subject.search(params[:search])
    if params[:search]
      @subjects = @search.page(params[:page]).per(page_paginate)
      if @subjects.size == 0
        flash.now[:alert] = "Ничего не найдено"
      end
      respond_with(@subjects)
    end
  end
  
  private
  
    def page_paginate
      15
    end
end
