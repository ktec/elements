class User < ActiveRecord::Base
  using_access_control
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  acts_as_tagger

  has_many :roles
  def role_symbols
    (roles || []).map {|r| r.title.to_sym}
  end
end
