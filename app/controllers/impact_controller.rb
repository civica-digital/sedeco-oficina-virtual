class ImpactController < ApplicationController
 before_action :get_json, :fill_array
 require 'json'
  
 def index

 end

private
 def get_json
  source = 'lib/impacto/impacto.json'
	file = File.read(source)
  @impacto = ActiveSupport::JSON.decode(file)#JSON.parse(file)
 end
 
 def fill_array
 	@respuestas_texto_array = []
    @respuestas_imagen_array = []
    @respuestas_siguiente_array = []
    @respuestas_rango_array = []
	@respuestas_hover_array = []
 end
 
end
