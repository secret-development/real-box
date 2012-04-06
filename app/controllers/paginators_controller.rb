# -*- encoding : utf-8 -*-
class PaginatorsController < ApplicationController
  respond_to :html
  before_filter :all_deny
  before_filter :settings_deny
  load_and_authorize_resource
  
  def index
    @paginators = Paginator.all
    @title = "Постраничный вывод"
    respond_with(@paginators)
  end
end
