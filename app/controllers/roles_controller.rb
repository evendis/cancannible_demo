class RolesController < InheritedResources::Base
  before_filter :authenticate_user!
  # we do not assert access restritions in this controller, so anyone can see all roles
end