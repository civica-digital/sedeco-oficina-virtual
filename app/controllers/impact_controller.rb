class ImpactController < ApplicationController
 before_action :get_json, :fill_array
 require 'json'
  
 def index
	@tipo_de_impacto = "Bajo Impacto"
	progreso_de_impacto = 0

	unless params[:savetime].blank?
		save_advance(params[:savetime][:actual],params[:savetime][:clicked])
	end
  
  unless params[:savedate].blank?
    save_advance_date(params[:savedate][:actual],params[:savedate][:clicked],params[:savedate][:date])
  end
  

	unless params[:pagetime].blank?    
    next_value = getNext(params[:pagetime][:next],params[:pagetime][:restriction],params[:pagetime][:next_restrictions])

		progreso_de_impacto =	get_progreso(params[:pagetime][:totals],next_value)
		respond_to do |format|
			if next_value == "-3"
				format.js { render :js => "finaliza_impacto_zonal();"}
			elsif next_value == "-2"
        format.js { render :js => "finaliza_impacto_vecinal('normal');"}
      elsif next_value == "-21"
        format.js { render :js => "finaliza_impacto_vecinal('cita');"}
      elsif next_value == "-1"
        format.js { render :js => "finaliza_bajo_impacto();"}
      else   	
    		format.js { render :js => "hidden_div(#{next_value},#{progreso_de_impacto});"}
    	end
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
	@respuestas_uso_restriccion_array = []
	@respuestas_siguiente_restriccion_array = []
 end

 def get_progreso(total, value)
 	(value.to_i * 100 / total.to_i)
 end

  #regresa el id de la vista que continua
 def getNext(next_val, restriction, next_restriction)
 	if restriction.to_i == -2 && session[:giro_usuario].to_i == -2 
 		next_restriction
 	else
 		next_val
 	end
 end

   #guarda los valores clickeados por el momento en la session del usuario
  def save_advance(actual, clicked)
   	case actual.to_i
  	 	when 1 #pregunta uno
  	 		case clicked.to_i
  		 		when 1
  		 			session[:has_bussine] = true
  		 		when 2
  		 			session[:has_bussine] = false
  		 		when 3
  		 			session[:has_bussine] = -4
  		 	else
  				session[:has_bussine] = false
  	 		end

  	 	when 2 #pregunta 2
  	 		case clicked.to_i
  		 		when 1..5
  					session[:giro_usuario] = -2
  		 		when 6
  		 			session[:giro_usuario] = 0
  		 		when 7
  		 			session[:giro_usuario] = -4
  		 	else
  		 		session[:giro_usuario] = -4
  	 		end

  	 	when 3 #pregunta 3
        case clicked.to_i
          when 1..4
            session[:giro_usuario] = -3
          when 6
            session[:giro_usuario] = -1
          when 7
            session[:giro_usuario] = -4
        else
          session[:giro_usuario] = -4
        end

  	 	when 4 #pregunta 4
        case clicked.to_i
          when 1
            session[:has_siapem] = true
          when 2
            session[:has_siapem] = false
          when 3
            session[:has_siapem] = -4
        else
          session[:has_siapem] = false
        end

  	 	when 6 #pregunta 6
        case clicked.to_i
          when 1
            session[:has_special_license] = true
          when 2
            session[:has_special_license] = false
          when 3
            session[:has_special_license] = -4
        else
          session[:has_special_license] = false
        end
  	else
   	
   	end
  end


    #guarda los valores clickeados por el momento en la session del usuario
  def save_advance_date(actual, clicked, date)
    case actual.to_i
      when 5 #pregunta 5
        case clicked.to_i
          when 3
            session[:date_siapem] = true
        else
          session[:date_siapem] = date
        end
    else
    
    end
  end

end
