class SafetyController < ApplicationController
 before_action :get_json, :init
 require 'json'
  
 def index

	unless params[:savetime].blank?
		save_advance(params[:savetime][:actual],params[:savetime][:clicked])
	end
  
  unless params[:savedate].blank?
    save_advance_date(params[:savedate][:actual],params[:savedate][:clicked],params[:savedate][:date])
  end
  
	unless params[:pagetime].blank?    
    next_value = getNext(params[:pagetime][:next],params[:pagetime][:restriction],params[:pagetime][:next_restrictions])

		progreso_de_seguridad =	get_progreso(params[:pagetime][:totals],next_value)
		respond_to do |format|	
    		format.js { render :js => "hidden_div(#{next_value},100,100,#{progreso_de_seguridad});"}
  	end
  end
  
 end

private
#obtiene el Json de seguridad
 def get_json
 	source = 'lib/seguridad/seguridad.json'
	file = File.read(source)
  @seguridad = ActiveSupport::JSON.decode(file)["seguridad"]["array_preguntas"]["pregunta"]#JSON.parse(file)
 end
 
  #regresa el id de la vista que continua
 def getNext(next_val, restriction, next_restriction)
 		next_val
 end

   #guarda los valores clickeados por el momento en la session del usuario
  def save_advance(actual, clicked)
  end


    #guarda los valores clickeados por el momento en la session del usuario
  def save_advance_date(actual, clicked, date)
  end


  #inicializa los arrays de seguridad y los Strings
 def init
  @respuestas_texto_array = []
  @respuestas_imagen_array = []
  @respuestas_siguiente_array = []
  @respuestas_rango_array = []
  @respuestas_hover_array = []
  @respuestas_id_array = []
  @respuestas_uso_restriccion_array = []
  @respuestas_siguiente_restriccion_array = []

  @tipo_de_impacto = ""
  @progreso_de_impacto = 100
  @progreso_de_suelo = 100
  @progreso_de_seguridad = 0
 end

end
