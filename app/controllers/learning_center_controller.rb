class LearningCenterController < ApplicationController
  helper_method :category_options

  def index
    @search = params[:search]
    @resources = Resources.search_results(@search)
  end

  private

  def category_options
    Resources.available_categories
  end
end
