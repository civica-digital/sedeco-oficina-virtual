class ZoningController < ApplicationController
 before_action :get_json, :init
 require 'json'
  
 def index
	

  unless params[:savetime].blank?
    save_advance(params[:savetime][:actual],params[:savetime][:clicked])
  end
  
  unless params[:savedate].blank?
    save_advance_rank(params[:savedate][:actual],params[:savedate][:clicked],params[:savedate][:date])
  end
  

  unless params[:pagetime].blank?    
    next_value = getNext(params[:pagetime][:next],params[:pagetime][:restriction],params[:pagetime][:next_restrictions])

    progreso_de_suelo = get_progreso(params[:pagetime][:totals],next_value)
    respond_to do |format|
      if next_value == "-5"
        format.js { render :js => "finaliza_uso_equipamiento();"}
      else  
        format.js { render :js => "hidden_div(#{next_value},100,#{progreso_de_suelo},0);"}
      end
    end
  end
  
 end

private
#obtiene el Json de impacto
 def get_json
 	source = 'lib/suelo/suelo.json'
	file = File.read(source)
  @suelo = ActiveSupport::JSON.decode(file)["suelo"]["array_preguntas"]["pregunta"]
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

    #guarda los valores clickeados por el momento en la session del usuario
  def save_advance_rank(actual, clicked, date)
  
  end


   #inicializa los arrays de impacto
 def init
  @respuestas_texto_array = []
  @respuestas_imagen_array = []
  @respuestas_siguiente_array = []
  @respuestas_rango_array = []
  @respuestas_hover_array = []
  @respuestas_id_array = []
  @respuestas_uso_restriccion_array = []
  @respuestas_siguiente_restriccion_array = []

  @tipo_de_suelo = ""
  @progreso_de_impacto = 100
  @progreso_de_suelo = 0
  @progreso_de_seguridad = 0
 end


end
