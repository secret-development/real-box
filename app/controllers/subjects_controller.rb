# -*- encoding : utf-8 -*-

class SubjectsController < ApplicationController

  respond_to :html
  before_filter :all_deny, :except => :guest
  before_filter :time_work, :except => :guest
  before_filter :check_fired, :except => :guest
  before_filter :load_type_subject, :only => :add_properties
  before_filter :load_attr, :only => :add_properties
  helper_method :sort_column, :sort_direction
  
  def index
    @subjects = Subject.order(sort_column + " " + sort_direction).page(params[:page]).per(page_paginate)
    @title = "Objects"
  end
  
  # active
  def active
    @subjects = Subject.active_subjects.order(sort_column + " " + sort_direction).page(params[:page]).per(page_paginate)
    @title = "Active objects"
  end
  
  # inactive
  def inactive
    @subjects = Subject.inactive_subjects.order(sort_column + " " + sort_direction).page(params[:page]).per(page_paginate)
    @title = "Inactive objects"
  end
  
  
  def show
    @subject = Subject.find(params[:id])
    @title = @subject.typesubject.name
    respond_with(@subject)
  end

  def new
    if params[:customer_id].nil?
      redirect_to(subjects_path, :alert => "No associated customer")
    else
      @title = "New object"
      session[:customer_id] = params[:customer_id]
      @subject = Subject.new
      respond_with(@subject)      
    end
  end
  
  def edit
    @subject = Subject.find(params[:id])
    @title = "Editing object"
    respond_with(@subject)
  end
  
  def create
    begin
      @customer = Customer.find(session[:customer_id])    
      @subject = @customer.subjects.build(params[:subject])
      if @subject.save
        session[:customer_id] = nil
        if @subject.typesubject.condition_fields.size > 0
          respond_with(@subject, :location => add_properties_subject_path(@subject))
        else
          flash[:notice] = "Object successfully created"
          respond_with(@subject)
        end
      else
        render 'new'
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to(subjects_path, :alert => "Something went wrong")
    end
  end
  
  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(params[:subject])
      flash[:notice] = "Object successfully updated"
      respond_with(@subject, :location => @subjects)
    else
      render 'edit'
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Object successfully removed"
    redirect_to subjects_path
  end


  # more methods
  
  def add_properties
    @subject = Subject.find(params[:id])
    @title = "Additional information"
    @subject.properties.build
  end
  
  def add_photo
    @subject = Subject.find(params[:id])
    @title = "Photos"
  end
  
  # AJAX -> subject -> floor/room
  def findtypesubject
    @typesubject = Typesubject.find(params[:id])
    respond_to do |format|
      format.json { render :json => @typesubject.to_json}
    end
  end
  
  # AJAX -> subject -> change typesubject
  # def load_attr
  #   typesubject = Typesubject.find(params[:id])
  #   @attr = typesubject.find_values
  #   respond_to do |format|
  #     format.json { render :json => @attr.to_json }
  #   end
  # end
  
  def guest
    @subject = Subject.find(params[:id])
    @title = "Guest access"
    render :layout => 'guest'
  end
  
  private
    
    def load_type_subject
      @subject = load_subject
      @typesubject = Typesubject.find(@subject.typesubject_id)
    end
    
    def load_subject
      @subject = Subject.find(params[:id])
    end
    
    def load_attr
      subject = load_subject
      typesubject = load_type_subject
      if typesubject.condition_fields.size > 0
        typesubject.condition_fields.each do |c|
          if c.typefield != "textfield" && c.typefield != "textarea" && c.value_fields.empty?
            redirect_to subject_path(subject),
              :alert => "No value for the additional field"
          else
            @attr = typesubject.find_values 
          end
        end
      else
        redirect_to subject_path(subject), 
          :alert => "Additional fields for this type of property is not listed in the settings"
      end
    end
    
    def sort_column
      Subject.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
    
    def page_paginate
      if Paginator.find_by_resource("объекты")
        Paginator.find_by_resource("объекты").paginate
      else
        25
      end
    end    
    
end
