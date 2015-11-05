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
      if next_value == "-11"
        format.js { render :js => "finaliza_sefuridad_visto_bueno();"}
      else
    		format.js { render :js => "hidden_div(#{next_value},100,100,#{progreso_de_seguridad});"}
      end
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
    if restriction.to_i == -3 && session[:impacto_usuario] == -2
      next_restriction
    elsif restriction.to_i == 50 && session[:aforo] != nil && session[:aforo].to_i > 50
      next_restriction
    else
      next_val
    end
 end

   #guarda los valores clickeados por el momento en la session del usuario
  def save_advance(actual, clicked)
    case actual.to_i
      when 3 #pregunta 3
        case clicked.to_i
          when 1
            session[:has_autodiagnostico] = true
          when 2
            session[:has_autodiagnostico] = false
          when 3
            session[:has_autodiagnostico] = -4
        else
          session[:has_autodiagnostico] = false
        end
          
      when 4 #pregunta 4
        case clicked.to_i
          when 1
            session[:vobo_seguridad] = true
          when 2
            session[:vobo_seguridad] = false
          when 3
            session[:vobo_seguridad] = -4
        else
          session[:vobo_seguridad] = false
        end
          
      when 5 #pregunta 5
        case clicked.to_i
          when 1
            session[:has_protection] = true
          when 2
            session[:has_protection] = false
          when 3
            session[:has_protection] = -4
        else
          session[:has_protection] = false
        end
          
      when 6 #pregunta 6
        case clicked.to_i
          when 1
            session[:make_protection] = true
          when 2
            session[:make_protection] = false
          when 3
            session[:make_protection] = -4
        else
          session[:make_protection] = false
        end
          
      when 7 #pregunta 7
        case clicked.to_i
          when 1
            session[:license_ambiental] = true
          when 2
            session[:license_ambiental] = false
          when 3
            session[:license_ambiental] = -4
        else
          session[:license_ambiental] = false
        end
          
      when 8 #pregunta 8
        case clicked.to_i
          when 1
            session[:license_sanitaria] = true
          when 2
            session[:license_sanitaria] = false
          when 3
              session[:license_sanitaria] = -4
        else
          session[:license_sanitaria] = false
        end

      when 9 #pregunta 9
        case clicked.to_i
          when 1
            session[:no_adeudos] = true
          when 2
            session[:no_adeudos] = false
          when 3
            session[:no_adeudos] = -4
        else
          session[:no_adeudos] = false
        end
      
      else
      end
  end


    #guarda los valores clickeados por el momento en la session del usuario
  def save_advance_date(actual, clicked, date)
    case actual.to_i
      when 1 #pregunta 1
        case clicked.to_i
          when 2
            session[:aforo] = 0
          else
            session[:aforo] = date
          end
      else
      end
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
