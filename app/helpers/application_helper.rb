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
  
  def edit_icon
    image_tag "edit-icon.png"
  end
  
  def delete_icon
    image_tag "delete-icon.png"
  end
  
  def flash_msg(object)
    render(:partial => "shared/flashmsg", :locals => {:object => object})
  end
end