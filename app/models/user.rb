# encoding:utf-8
class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :password, :password_confirmation, 
                  :password_reset_token, :password_reset_sent_at, 
                  :role, :lastname, :firstname, :phonehome, :phonemobile
  #encript password before save
  before_save :encrypt_password
  # remember me
  before_create { generate_token(:auth_token) }
  # validations
  
  has_many :transactions
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :password,# :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..20}, :on => :create
  validates :password_confirmation, :presence => true, :on => :create#, :on => :update
  validates :email, :uniqueness => { :case_sensitive => false}
  validates :email, :presence => true, :format => {:with => email_regex}
  validates :lastname, :firstname, :presence => true, :on => :create
  validates :phonehome, :phonemobile, :numericality => { :only_integer => true }, :allow_blank => true
  
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
  
  def button_value
    if new_record?
      "Создать"
    else
      "Изменить"      
    end    
  end
  
end
