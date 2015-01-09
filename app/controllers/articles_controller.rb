class ArticlesController < InheritedResources::Base
  before_filter :authenticate_user!
  # we are asserting access restritions in this controller.
  # This is a CanCan + InheritedResources method that effectively
  # restricts access to Article.accessible_by(current_ability)
  load_and_authorize_resource
end