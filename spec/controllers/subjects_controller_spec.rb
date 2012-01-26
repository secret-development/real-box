# encoding: UTF-8
require 'spec_helper'

describe SubjectsController do
  render_views

  before(:each) do
    @subject = Factory(:subject)
  end
  
  it "get index" do
    get :index
    response.should be_success
  end

  it "get show" do
    get :show, :id => @subject.id
    response.should be_success
  end

  it "get new" do
    get :new
    response.should be_success
  end
  
  it "get edit" do
    get :edit, :id => @subject.id
    response.should be_success
  end
  
  describe "POST 'create'" do
    describe "failure" do
      
      before(:each) do
        @attr = invalid_data
      end
      
      it "should render the 'new' page" do
        post :create, :subject => @attr
        response.should render_template('new')
      end
      
      it "should not create a subject" do
        lambda do
          post :create, :subject => @attr
        end.should_not change(Subject, :count)
      end
    end
    
    describe "success" do
      before(:each) do
        # valid data
        @attr = valid_data
      end
      
      it "should create a subject" do
        lambda do
          post :create, :subject => @attr
        end.should change(Subject, :count).by(1)
      end
      
      it "should redirect to the subject show page" do
        post :create, :subject => @attr
        response.should redirect_to(subject_path(assigns(:subject)))
      end
      
      it "should have a success message" do
        post :create, :subject => @attr
        flash[:notice].should =~ /Объект успешно добавлен/i
      end
    end
  end
  
  describe "PUT 'update'" do
    describe "failure update" do
      before(:each) do
        # #invalid data
        @attr = invalid_data
      end
      
      it "should render the 'edit' page" do
        put :update, :id => @subject.id, :subject => @attr
        response.should render_template('edit')
      end
      
      it "should not update a subject" do
        lambda do
          put :update, :id => @subject.id, :subject => @attr
        end.should_not change(Subject, :count)
      end
    end
    
    describe "success update" do
      before(:each) do
        @attr = valid_data
      end
      
      it "should redirect to subject" do
        put :update, :id => @subject.id, :subject => @attr
        response.should redirect_to(subject_path(assigns(:subject)))
      end
      
      it "should not create a subject" do
        lambda do
          put :update, :id => @subject.id, :subject => @attr
        end.should_not change(Subject, :count)
      end
      
      it "should have a success message" do
        put :update, :id => @subject.id, :subject => @attr
        flash[:notice].should =~ /Объект успешно обновлён/i
      end
    end
  end
  
  describe "DELETE 'destroy'" do
    
    it "should redirect to subjects" do
      delete :destroy, :id => @subject.id
      response.should redirect_to(subjects_path)
    end
    
    it "should destroy the subject" do
      lambda do
        delete :destroy, :id => @subject.id
      end.should change(Subject, :count).by(-1)
    end
    
    it "should succss message" do
      delete :destroy, :id => @subject.id
      flash[:notice].should =~ /Объект успешно удален/i
    end
  end
  
  def valid_data
    {
      :typesubject => "квартира",
      :cityname => "костанай",
      :township => "центр",
      :address => "абая 165, 119",
      :price => 70000,
      :numbofrooms => 3,
      :square => 72.0,
      :kitchensquare => 15.0,
      :livingsquare => 57.0,
      :floor => 7,
      :typestructure => "панельный",
      :yearofconstruction => 1950,
      :telephone => "yes",
      :furniture => "yes",
      :internet => "no",
      :balcony => "лоджия",
      :wc => "раздельный",
      :layout => "сталинка",
      :state => "отличное"
    }
  end
  
  
  def invalid_data
    {
      :typesubject => "", :cityname => "", :township => "",
      :address => "", :price => 70000, :numbofrooms => 3,
      :square => 72.0, :kitchensquare => 15.0, :livingsquare => 57.0,
      :floor => 7, :typestructure => "", :yearofconstruction => 1950,
      :telephone => "", :furniture => "", :internet => "", :balcony => "",
      :wc => "", :layout => "", :state => ""
    }
  end
end
