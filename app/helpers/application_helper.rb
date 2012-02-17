# encoding:utf-8
module ApplicationHelper
  include Icons
  
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
  
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil)
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
