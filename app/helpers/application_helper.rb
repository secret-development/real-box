# encoding:utf-8
module ApplicationHelper
  
  # cities
  KOSTANAY = [ "Костанай", "Лисаковск", "Рудный", "Житикара"]
  CURRENT_CITY = KOSTANAY
  
  # type subjects:
  TS = ["Квартира", "Коттедж", "Комната", "Офис", "Дача"]
  
  # type structure:
  TYPESTR = ["Кирпичное", "Панельное", "Шлакоблочное", "Монолитное", "Деревянное"]
  
  # YEAR OF CONSTRUCTIONS
  current_year = Time.now.year
  YEAROFCONSTR = (1900..current_year).to_a
  
  # YES OR NOW
  YOR = ["Да", "Нет", "Неизвестно"]
  
  # Balcony
  BALCONY = ["Балкон","Лоджия","Нет","Неизвестно"]
  
  # WC
  WC = ["Раздельный","Совмещенный","Неизвестно"]

  # LAYOT
  LAYOUT = ["\"Сталинка\"", "\"Хрущевка\"", "Улучшенная планировка", 
            "\"Новая\" планировка", "Другая"]

 
 # STATE
 STATE = ["Евроремонт","Идеальное","Хорошее","После строительства",
          "Требуется ремонт", "Удовлетворительное"]
          
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