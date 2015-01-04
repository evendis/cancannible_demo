class Article < ActiveRecord::Base
  attr_accessible :title, :body, :customer, :group

  belongs_to :group
  belongs_to :customer
end
