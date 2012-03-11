# -*- encoding : utf-8 -*-
class ResultsController < ApplicationController
  
  def index
    @subjects = Subject.where{address =~ '%Пушкин%'}
  end
  
end
