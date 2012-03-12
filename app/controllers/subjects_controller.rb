# -*- encoding : utf-8 -*-

class SubjectsController < ApplicationController
  respond_to :html
  before_filter :all_deny
  helper_method :sort_column, :sort_direction
  before_filter :load_type_subject, :only => :add_properties
  before_filter :load_attr, :only => :add_properties
  
  
  def index
    @title = "Объекты"
    @subjects = Subject.order(sort_column + " " + sort_direction).page(params[:page]).per(page_paginate)
    respond_with(@subjects)
  end
  
  # active
  def active
    @title = "Активные объекты"
    @subjects = Subject.active_subjects.page(params[:page]).per(page_paginate)
    respond_with(@subjects)
  end
  
  # inactive
  def inactive
    @title = "Неактивные объекты"
    @subjects = Subject.inactive_subjects.page(params[:page]).per(page_paginate)
    respond_with(@subjects)
  end
  
  
  def show
    @subject = Subject.find(params[:id])
    @title = @subject.typesubject.name
    respond_with(@subject)
  end

  def new
    if params[:customer_id].nil?
      redirect_to(subjects_path, :alert => "Нет привязанного клиента")
    else
      @title = "Новый объект"
      session[:customer_id] = params[:customer_id]
      @subject = Subject.new
      respond_with(@subject)      
    end
  end
  
  def edit
    @subject = Subject.find(params[:id])
    @title = "Редактирование объекта"
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
          flash[:notice] = "Объект успешно создан"
          respond_with(@subject)
        end
      else
        render 'new'
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to(subjects_path, :alert => "Что-то пошло не так")
    end
  end
  
  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(params[:subject])
      flash[:notice] = "Объект успешно обновлён"
      respond_with(@subject, :location => @subjects)
    else
      render 'edit'
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Объект успешно удалён"
    redirect_to subjects_path
  end


  # more methods
  
  def add_properties
    @subject = Subject.find(params[:id])
    @title = "Дополнительная информация"
    @subject.properties.build
  end
  
  def add_photo
    @subject = Subject.find(params[:id])
    @title = "Фотографии"
  end
  
  # AJAX -> subject -> floor
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
        @attr = typesubject.find_values  
      else
        redirect_to subject_path(subject), 
          :alert => "Дополнительные поля для данного типа недвижимости не указаны в настройках"
      end
    end
  
    def sort_column
      Subject.column_names.include?(params[:sort]) ? params[:sort] : "typetransaction_id"    
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"    
    end
    
    def page_paginate
      20
    end
    
end
