# -*- encoding : utf-8 -*-
module ApplicationHelper
  include Icons
  require 'simple_form'
  
  def base_title
    "Этванс"
  end
  
  def title
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
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), :class => css_class
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
  
  def to_formatted_date(object)
    object.strftime('%d.%m.%Y')
  end
  
  def to_datetime(object)
    object.strftime('%d.%m.%Y %H:%M:%S')
  end

  def type_customer(object)
    if object == true
      "Потенциальный"
    else
      "Действующий"
    end
  end
  
  def to_area(object)
    if object == nil
      raw("– м&sup2;")
    else
      raw("#{object} м&sup2;")
    end
  end
  
  def properties_views_zero?(object)
    if object.properties.size > 0
      false
    else
      true
    end    
  end
  
  
  def properties_zero?(object)
    if object.properties.size > 1
      false
    else
      true
    end
  end
  
  # form builder for add_properties(if properties == 0)
  def property_builder(f, key, value)
    case value[:typefield]
    when "textfield"
      textfield_build(f, key, value)
    when "select"
      select_build(f, key, value)
    when "checkbox"
      checkbox_build(f, key, value)
    when "radio"
      radio_build(f, key, value)
    when "textarea"
      textarea_build(f, key, value)
    end
  end
  
  def hidden_builder_cond(f, key, value)
    f.input :condition, :as => :hidden, :input_html => { :value => key }
  end
  
  def hidden_builder_type(f, key, value)
    f.input :typefield, :as => :hidden, :input_html => { :value => key }
  end
  
  def textfield_build(form, key, value)
    form.input :value, :label => "#{key}:"
  end
  
  def select_build(form,key,value)
    form.input :value, :label => "#{key}:", :as => :select, 
    :collection => value[:value].map { |v| v}, :include_blank => false
  end
  
  def radio_build(form,key,value)
    form.input :value, :label => "#{key}:", :as => :radio_buttons, 
      :collection => value[:value].map { |v| v}, :include_blank => false
  end
  
  def textarea_build(form,key,value)
    form.input :value, :label => "#{key}:", :as => :text, 
      :input_html => { :rows => 4 }
  end
  
  # def checkbox_build(form,key,value)
  #   form.input :value, :label => "#{key}:", :as => :check_boxes, 
  #     :collection => value[:value].map { |v| v}, :include_blank => false
  # end
  # end # form builder for add_properties(if properties == 0)
  
  # form builder for add_properties(if properties > 0)
  def property_edit(p, attributes)
    case p.object.typefield
    when "select"
      select_edit(p, attributes)
    when "radio"
      radio_edit(p, attributes)
    when "textfield"
      textfield_edit(p)
    when "textarea"
      textarea_edit(p)
    end
  end
  
  def select_edit(p, attributes)
    p.input :value, :label => "#{p.object.condition}:", :as => :select,
      :collection => attributes[p.object.condition][:value].map {|v| v},
      :include_blank => false
  end
  
  def radio_edit(p, attributes)
    p.input :value, :label => "#{p.object.condition}:", :as => :radio_buttons,
      :collection => attributes[p.object.condition][:value].map { |v| v},
      :include_blank => false
  end 
      
  def textfield_edit(p)
     p.input :value, :label => "#{p.object.condition}:"
  end 
      
  def textarea_edit(p)
    p.input :value, :label => "#{p.object.condition}:", :as => :text,
      :input_html => { :rows => 4 }
  end  
  # end form builder for add_properties(if properties > 0)
  
  def active_subject?(object)
    if object.active == true
      image_tag('active.png', :title => "Активен")
    else
      image_tag('busy.png', :title => "Не активен")
    end
  end
  
  def active_subject_text?(object)
    if object.active == true
      "Активен"
    else
      "Не активен"
    end
  end
  
  # price currency
  
  def price_currency(object)
    case object.price_currency
    when "доллар"
      to_dollar(object)
    when "тенге"
      to_tenge(object)
    when "евро"
      to_euro(object)
    when "рубль"
      to_ruble(object)
    end
  end
  
  def to_dollar(object)
    number_to_currency(object.price, :locale => :ru, :precision => 0,
      :unit => "$ ", :delimiter => " ", :format => "%n %u")
  end
  
  def to_tenge(object)
    number_to_currency(object.price, :locale => :ru, :precision => 0,
      :unit => "тг.", :delimiter => " ", :format => "%n %u")
  end
  
  def to_euro(object)
    number_to_currency(object.price, :locale => :ru, :precision => 0,
      :unit => "€ ", :delimiter => " ", :format => "%n %u")
  end
  
  def to_ruble(object)
    number_to_currency(object.price, :locale => :ru, :precision => 0,
      :unit => "руб.", :delimiter => " ", :format => "%n %u")
  end
  

  # search methods:
  def isset_photo?(object)
    if object.photos.any?
      true
    else
      false
    end
  end
  
  def isset_data(object)
    if object.nil?
      "–"
    else
      object
    end
  end
  
  # for reports

  MONTH = ["Неделя", "Месяц", "Квартал", "Год"]
  OBJECTS = ["Клиенты", "Объекты"]

  # for transaction views:
  
  def have_object?(object)
    if object.nil?
      false
    else
      true
    end
  end

end
