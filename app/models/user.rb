class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :name, :email, :password

  validates :name,     :presence => true
  validates :email,    :presence => true


  validates :name,  :uniqueness => true
  validates :email, :uniqueness => true


  validates :name,     :length => { :minimum => 6, :maximum => 15 }
  validates :password, :length => { :minimum => 6 }

  validates :email, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }


  def self.authenticate(username, password)
    where(:name => username).try(:authenticate, password)
  end

end
