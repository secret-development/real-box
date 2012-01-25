# encoding:utf-8
module ApplicationHelper

  # cities
  KOSTANAY = [ "Костанай", "Лисаковск", "Рудный", "Житикара"]
  CURRENT_CITY = KOSTANAY
  
  # type subjects:
  TS = ["Квартира", "Коттедж", "Комната", "Офис", "Дача"]
  
  def title
    base_title = "Система: ReHandy"
    if @title
      "#{base_title} | #{@title}"
    else
      base_title
    end
  end
end

# todo: сделать отдельно таблицу для районов которые будут привязанны к городам