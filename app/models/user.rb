class User < ActiveRecord::Base
  attr_accessible :email, :login, :password_digest
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :login, :on => :create
  validates_presence_of :email, :on => :create
end
