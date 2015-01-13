class CustomersController < ApplicationController
  before_filter :authenticate_user!

  # we are asserting access restritions in this controller.
  #
  # Instead of relying on CanCan + InheritedResources integration,
  # here we just use standard Rails controller capabilities
  # to present an authorised collection to the view

  before_filter :load_collection

  def load_collection
    @customers ||= if current_user.can? :read, Customer
      Customer.accessible_by(current_ability)
    else
      raise CanCan::AccessDenied
    end
  end

end