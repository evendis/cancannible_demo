class Article < ActiveRecord::Base
  attr_accessible :title, :body, :customer, :group
  default_scope order(:id)

  belongs_to :group
  belongs_to :customer
end
