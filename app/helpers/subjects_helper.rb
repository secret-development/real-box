# -*- encoding : utf-8 -*-
module SubjectsHelper

  def floor?(object)
    if object.new_record?
      typesubject = Typesubject.first
      typesubject.floor == true
    else
      object.typesubject.floor == true
    end
  end
  
  def room?(object)
    if object.new_record?
      typesubject = Typesubject.first
      typesubject.room == true
    else
      object.typesubject.room == true
    end
  end
  
  def resident?(object)
    if object.new_record?
      typesubject = Typesubject.first
      typesubject.resident == true
    else
      object.typesubject.resident == true
    end
  end
  
end
