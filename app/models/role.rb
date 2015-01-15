class Role < ActiveRecord::Base
  attr_accessible :name
  default_scope order(:id)

  include Cancannible::Grantee

end
