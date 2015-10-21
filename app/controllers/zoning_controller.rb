class ZoningController < ApplicationController
 before_action :get_json, :fill_array
 require 'json'
  
 def index
	@tipo_de_suelo = ""
	@progreso_de_impacto = 100
  @progreso_de_suelo = 0

  unless params[:savetime].blank?
    save_advance(params[:savetime][:actual],params[:savetime][:clicked])
  end
  
  unless params[:savedate].blank?
    save_advance_date(params[:savedate][:actual],params[:savedate][:clicked],params[:savedate][:date])
  end
  

  unless params[:pagetime].blank?    
    next_value = getNext(params[:pagetime][:next],params[:pagetime][:restriction],params[:pagetime][:next_restrictions])

    progreso_de_suelo = get_progreso(params[:pagetime][:totals],next_value)
    respond_to do |format|
      format.js { render :js => "hidden_div(#{next_value},100,#{progreso_de_suelo},0);"}
    end
  end
  
 end

private
#obtiene el Json de impacto
 def get_json
 	source = 'lib/suelo/suelo.json'
	file = File.read(source)
  	@suelo = ActiveSupport::JSON.decode(file)
 end
 
 #inicializa los arrays de impacto
 def fill_array
 	@respuestas_texto_array = []
  @respuestas_imagen_array = []
  @respuestas_siguiente_array = []
  @respuestas_rango_array = []
	@respuestas_hover_array = []
	@respuestas_id_array = []
	@respuestas_uso_restriccion_array = []
	@respuestas_siguiente_restriccion_array = []
 end

#obtiene el progreso del progresBar
 def get_progreso(total, value)
 	(value.to_i * 100 / total.to_i) - 10
 end

  #regresa el id de la vista que continua
 def getNext(next_val, restriction, next_restriction)
 	if restriction.to_i == -20 && session[:suelo_usuario].to_i == -20
 		next_restriction
 	else
 		next_val
 	end
 end


  #guarda los valores clickeados por el momento en la session del usuario
  def save_advance(actual, clicked)
  
  end


end
