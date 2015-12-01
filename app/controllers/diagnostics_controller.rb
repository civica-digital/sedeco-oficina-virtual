class DiagnosticsController < ApplicationController
  
  def index
  end

  def download_diagnostic
      render :pdf => "file_name", :template => "diagnostics/download_diagnostic.pdf.haml"
  end
end