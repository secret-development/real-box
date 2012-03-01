# encoding:utf-8
class SubjectsController < ApplicationController
  respond_to :html
  before_filter :all_deny
  
  def index
    @subjects = Subject.page(params[:page]).per(20)
    respond_with(@subjects)
  end
  
  def show
    @subject = Subject.find(params[:id])
    respond_with(@subject)
  end

  def new
    if params[:customer_id].nil?
      redirect_to(subjects_path, :alert => "Нет привязанного клиента")
    else
      session[:customer_id] = params[:customer_id]
      @subject = Subject.new
      respond_with(@subject)      
    end
  end
  
  def edit
    @subject = Subject.find(params[:id])
    respond_with(@subject)
  end
  
  def create
    begin
      @customer = Customer.find(session[:customer_id])    
      @subject = @customer.subjects.build(params[:subject])
      if @subject.save
        flash[:notice] = "Объект успешно создан"
        session[:customer_id] = nil
        respond_with(@subject, :location => @subject)
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
  
  def add_photo
    @subject = Subject.find(params[:id])  
  end
  
  # AJAX -> subject -> floor
  def findtypesubject
    @typesubject = Typesubject.find(params[:id])
    respond_to do |format|
      format.json { render :json => @typesubject.to_json}
    end
  end
  
  # AJAX -> subject -> change typesubject
  def load_attr
    @subject = Subject.find(params[:id])
    if @subject.new_record?
      first = Typesubject.first
      first = find_values
    else
      @attr = @subject.typesubject.find_values  
    end
  end
  
end
