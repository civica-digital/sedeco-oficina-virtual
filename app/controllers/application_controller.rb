class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  require 'json'

  #obtiene el progreso del progresBar
 def get_progreso(total, value)
 	(value.to_i * 100 / total.to_i) - 10
 end

  def get_json(file)
 	source = 'lib/inputs/'+file
	file = File.read(source)
  @impacto = ActiveSupport::JSON.decode(file)["impacto"]["array_preguntas"]["pregunta"]#JSON.parse(file)
 end

 
end
