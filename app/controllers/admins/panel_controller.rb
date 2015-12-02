class Admins::PanelController < ApplicationController
  layout 'admins'
  before_action :authenticate_admin!
end
