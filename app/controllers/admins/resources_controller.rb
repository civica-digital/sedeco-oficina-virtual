class Admins::ResourcesController < ApplicationController
  layout 'admins'
  before_action :authenticate_admin!
  helper_method :category_options
  before_filter :set_resource, only: [:edit, :update, :destroy]

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def edit
    
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      redirect_to admins_resources_path, notice: t(".resource_created")
    else
      render :new
    end
  end


   def update
      respond_to do |format|
        if @resource.update(resource_params)
          format.html { redirect_to admins_resources_path, notice:  t(".resource_edited") }
          format.json { render :show, status: :ok, location: @line }
        else
          format.html { render :edit }
          format.json { render json: @resource.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy

      @resource.destroy
      respond_to do |format|
        format.html { redirect_to admins_resources_path notice: t(".resource_deleted") }
        format.json { head :no_content }
      end
    end

  private

  def set_resource
       @resource = Resource.find(params[:id])
  end

  def category_options
    Resources.available_categories
  end

  def resource_params
    params.require(:resource).permit(:name, :url, :category,:title, :description)
  end
end
