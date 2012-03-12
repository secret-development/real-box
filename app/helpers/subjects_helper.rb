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
  
end
