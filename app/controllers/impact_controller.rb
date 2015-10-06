class ImpactController < ApplicationController
 before_action :get_json, :fill_array
 require 'json'
  
 def index
	@tipo_de_impacto = "Bajo Impacto"
	unless params[:pagetime].blank?
		params[:pagetime][:root]
		puts params[:pagetime][:button]
		respond_to do |format|
    		format.js { render :js => "hidden_div(2);" }
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
 
end
