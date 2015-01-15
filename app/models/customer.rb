class Customer < ActiveRecord::Base
  attr_accessible :name
  default_scope order(:id)
end
