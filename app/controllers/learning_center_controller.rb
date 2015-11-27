class LearningCenterController < ApplicationController
  def index
    @resources = Resource.all
  end
end
