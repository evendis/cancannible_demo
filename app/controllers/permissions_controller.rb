class PermissionsController < InheritedResources::Base
  before_filter :authenticate_user!
  # we do not assert access restritions in this controller, so anyone can see all permissions
end