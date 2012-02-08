require 'spec_helper'

describe Task do
  
  before(:each) do
    
    @attr = {
      :title => "MyTask",
      :description => "Just to do something",
      :user_id => 1,
      :deadline => "2012-02-08",
      :done => false
    }
  end
  
  describe "validates presence" do
    
    it "should create a new instance given a valid attribute" do
      @task = Task.create!(@attr)
    end
    
    it "should require a title" do
      req_presence_sub(:title).should_not be_valid
    end
    
    it "should require a description" do
      req_presence_sub(:description).should_not be_valid
    end
    
    it "should require user's id" do
      req_presence_sub(:user_id).should_not be_valid
    end
    
    it "should require a deadline" do
      req_presence_sub(:deadline).should_not be_valid
    end
    
    # Require presence task(validates :presence => true)
    def req_presence_sub(par)
      @task = Task.new(@attr.merge(par => ""))
    end
    
  end
  
  describe "other validations" do
    
    it "should require a 'done' field (true or false)" do
      req_inclusion_of(:done).should_not be_valid
    end
    
    it "should eject titles that are too long" do
      long_title = "a" * 141
      long_title_task = Task.new(@attr.merge(:title => long_title))
      long_title_task.should_not be_valid
    end
    
    it "should eject descriptions that are too long" do
      long_description = "a" * 801
      long_description_task = Task.new(@attr.merge(:description => long_description))
      long_description_task.should_not be_valid
    end
    
    # Require inclusion_of task(validates_inclusion_of :in => [true, false])
    def req_inclusion_of(par)
      @task = Task.new(@attr.merge(par => ""))
    end
    
  end
  
end

# == Schema Information
#
# Table name: tasks
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  description :text
#  user_id     :integer(4)
#  deadline    :date
#  done        :boolean(1)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#