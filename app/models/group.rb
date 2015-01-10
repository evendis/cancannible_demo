class Group < ActiveRecord::Base
  attr_accessible :name

  include Cancannible::Grantee

end
