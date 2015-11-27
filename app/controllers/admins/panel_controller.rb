class Admins::PanelController < ApplicationController
  before_action :authenticate_admin!
end
