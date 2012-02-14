#encoding: UTF-8

class Task < ActiveRecord::Base
  
  attr_accessible :title, :description, :user_id, :deadline, :done
  belongs_to :user
  
  validates :user_id,
            :presence => true
  validates :title, 
            :presence => true,
            :length => { :maximum => 140 }
  validates :description,
            :presence => true,
            :length => { :maximum => 800 }
  validates :deadline, 
            :presence => true,
            :timeliness => { :on_or_after => :date_for_validation, :type => :datetime }
  validates_inclusion_of :done, :in => [true, false]
  
  def status
    if done == true
      "Да "
    else
      "Нет"
    end
  end
  
  def button_value
    if new_record?
      "Добавить"
    else
      "Обновить"  
    end
  end
  
  def legend
    if new_record?
      "Добавление"
    else
      "Редактирование"
    end
  end
  
  def date_for_validation
    if new_record?
      Time.now
    else
      created_at
    end
  end
  
end

#TODO: file_attachment
#TODO: data picker
#TODO: bootstrap collapse (уточнить время)
# == Schema Information
#
# Table name: tasks
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  description :text
#  user_id     :integer(4)
#  deadline    :datetime
#  done        :boolean(1)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#