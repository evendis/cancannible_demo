class ArticlesController < InheritedResources::Base
  before_filter :authenticate_user!
  load_and_authorize_resource

  # we are asserting access restritions in this controller.
  #
  # This uses CanCan + InheritedResources integration that effectively
  # restricts access to Article.accessible_by(current_ability)
  #
  # To see how you could do this without InheritedResources, see the CustomersController

end