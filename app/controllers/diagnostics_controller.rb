class DiagnosticsController < ApplicationController
  
  def index
    @appontment = make_appointment(session[:has_zoning], session[:date_siapem],session[:date_zoning],session[:has_siapem])
  end

  def download_diagnostic
      render :pdf => "file_name", :template => "diagnostics/download_diagnostic.pdf.haml", no_background: false, background: true
  end

private
  def make_appointment(has_zoning, date_siapem,date_zoning,has_siapem)
    if !has_zoning || !(date_siapem.to_i == date_zoning.to_i || (date_siapem.to_i - 1) == date_zoning.to_i) || !has_siapem  
      true
    else
      false
    end
  end
  
end