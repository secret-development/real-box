# encoding:utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def title
    base_title = "Система: ReHandy"
    if @title
      "#{base_title} + #{@title}"
    else
      base_title
    end
  end
  
end
