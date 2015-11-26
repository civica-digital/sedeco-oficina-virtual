class Admins::ResourcesController < ApplicationController
  layout 'admins'
  before_action :authenticate_admin!

  def index
  end
end
