class Admins::ResourcesController < ApplicationController
  layout 'admins'
  before_action :authenticate_admin!
  helper_method :category_options

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      redirect_to admins_resources_path, notice: t(".resource_created")
    else
      render :new
    end
  end

  private

  def category_options
    Resources.available_categories
  end

  def resource_params
    params.require(:resource).permit(:name, :url, :category)
  end
end
