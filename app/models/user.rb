class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :handle, :email, :password

  has_many :votes
  has_many :questions
  has_many :answers

  validates :handle,   :presence => true
  validates :email,    :presence => true

  validates :handle, :uniqueness => true
  validates :email,  :uniqueness => true

  validates :handle,   :length => { :minimum => 6, :maximum => 15 }
  validates :password, :length => { :minimum => 6 }

  validates :handle, :format => { :with => /^[A-Za-z\d_]+$/}
  validates :email,  :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates :password, :format => { :with => /^[A-Za-z\d_]+$/}

  def to_param
    handle
  end
  
end
