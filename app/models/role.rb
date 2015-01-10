class Role < ActiveRecord::Base
  attr_accessible :name

  include Cancannible::Grantee

end
