class ImpactController < ApplicationController
 before_action :get_json, :fill_array
 require 'json'
  
 def index
	@tipo_de_impacto = "Bajo Impacto"
	@progreso_de_impacto = 0

	unless params[:pagetime].blank?
		next_value = params[:pagetime][:next]
		@progreso_de_impacto =	get_progreso(params[:pagetime][:totals],next_value)
		respond_to do |format|
    		format.js { render :js => "hidden_div(#{next_value},#{@progreso_de_impacto});"}
  		end
    end

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
	@respuestas_id_array = []
 end

 def get_progreso(total, value)
 	(value.to_i * 100 / total.to_i)
 end
 
end
