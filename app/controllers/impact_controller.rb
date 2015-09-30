class ImpactController < ApplicationController
 before_action :get_json
 require 'json'
  
 def index
  @impacto["impacto"]["array_preguntas"]["pregunta"].each do |pregunta|
   puts pregunta["numero"]
   puts pregunta["texto"]
    pregunta["array_respuestas"]["respuesta"].each do |respuestas|
      puts respuestas
    end
   puts '****************'
  end
 end

private
 def get_json
  source = 'lib/impacto/impacto.json'
	file = File.read(source)
  @impacto = ActiveSupport::JSON.decode(file)#JSON.parse(file)
 end
end
