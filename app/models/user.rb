class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :password_confirmation, :customer, :group

  belongs_to :group
  belongs_to :customer

  has_many :users_roles, class_name: 'UsersRoles'
  has_many :roles, through: :users_roles

  include Cancannible::Grantee

end
