# encoding:utf-8
module ApplicationHelper
          
  def title
    base_title = "Система: ReHandy"
    if @title
      "#{base_title} | #{@title}"
    else
      base_title
    end
  end
  
  def error_messages_for(object)
    render(:partial => "shared/error_messages", :locals => {:object => object})
  end
  
end