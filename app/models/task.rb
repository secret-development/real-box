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
            :timeliness => { :on_or_after => lambda { Time.now }, :type => :datetime }
  validates_inclusion_of :done, :in => [true, false]
  
end

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