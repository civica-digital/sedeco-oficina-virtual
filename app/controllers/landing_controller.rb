class LandingController < ApplicationController
	layout 'landing'

  def index
  	clean_params_session
  end
end