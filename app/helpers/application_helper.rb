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
  
  def flash_msg(object)
    render(:partial => "shared/flashmsg", :locals => {:object => object})
  end
  
  def edit_icon
    raw("<i class='icon-pencil'></i>")
  end
  
  def delete_icon
    raw("<i class='icon-trash'></i>")
  end
  
  def eye_icon
    raw("<i class='icon-eye-open'></i>")    
  end
  
  def plus_icon
    raw("<i class='icon-plus'></i>")  
  end
  
  def list_icon
    raw("<i class='icon-list-alt'></i>")    
  end
  
  def sortable(column, title=nil)
    title ||= column.titleize
    direction = (column ==params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction        
  end
  
end
