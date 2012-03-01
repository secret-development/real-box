# encoding:utf-8
class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :password, :password_confirmation, 
                  :password_reset_token, :password_reset_sent_at, 
                  :role, :lastname, :firstname
  #encript password before save
  before_save :encrypt_password
  # remember me
  before_create { generate_token(:auth_token) }
  # validations
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :password,# :presence => true,
                       :confirmation => true
                       #:length => {:within => 6..20}
  validates :password_confirmation, :presence => true, :on => :create
  validates :email, :uniqueness => { :case_sensitive => false}
  validates :email, :presence => true, :format => {:with => email_regex}
  validates :lastname, :firstname, :presence => true, :on => :create
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end    
  end
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil      
    end        
  end
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64      
    end while User.exists?(column => self[column])    
  end
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver    
  end
  
  def legend_value
    if new_record?
      "Добавление нового сотрудника"
    else
      "Изменение анкетных данных"      
    end
  end
  
  def label_value
    if new_record?
      "Введите пароль"
    else
      "Введите новый пароль"      
    end    
  end
  
end
