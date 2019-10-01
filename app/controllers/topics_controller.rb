class TopicsController < ActionController::API
  def index
    @topics = Topic.all
  end
end
