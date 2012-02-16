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
  
  def plus_icon_white
    raw("<i class='icon-plus icon-white'></i>")  
  end
  
  def list_icon
    raw("<i class='icon-list-alt'></i>")    
  end
  
  def isset_field(object)
    object.empty? ? "нет данных" : object
  end
  
  def isset_mail(object)
    if object.empty?
      "нет данных"
    else
      mail_to object, object
    end
  end
  
  def to_date(object)
    object.to_date
  end

  def type_customer(object)
    if object == true
      "Потенциальный"
    else
      "Действующий"
    end
  end
  
  def to_dollar(object)
    "#{object} $"
  end
  
  def to_area(object)
    raw("#{object} м&sup2;")
  end
  
end
