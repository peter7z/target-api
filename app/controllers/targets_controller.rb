class TargetsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.targets.create!(target_params)
  end

  def index
    @targets = current_user.targets.includes(:topic)
  end

  private

  def target_params
    params.require(:target).permit(:title, :radius, :latitude, :longitude, :topic_id)
  end
end
