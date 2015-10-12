class ImpactController < ApplicationController
 before_action :get_json, :fill_array
 require 'json'
  
 def index
	@tipo_de_impacto = "Bajo Impacto"
	@progreso_de_impacto = 0

	unless params[:savetime].blank?
		save_advance(params[:savetime][:actual],params[:savetime][:clicked])
		puts session[:has_bussine]
		puts session[:giro_usuario]
	end

	unless params[:pagetime].blank?
    puts params[:pagetime][:next]
    puts params[:pagetime][:restriction]
    puts params[:pagetime][:next_restrictions]

		next_value = getNext(params[:pagetime][:next],params[:pagetime][:restriction],params[:pagetime][:next_restrictions])
    puts '****************'
    puts next_value
		progreso_de_impacto =	get_progreso(params[:pagetime][:totals],next_value)
		respond_to do |format|
			if next_value == "-3"
				format.js { render :js => "finaliza_impacto_zonal();"}
			elsif next_value == "-2"
        format.js { render :js => "finaliza_impacto_vecinal();"}
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

 def getNext(next_val, restriction, next_restriction)
    puts '****************XDXD'
    puts restriction
    puts next_restriction
    puts session[:giro_usuario]
 	if restriction.to_i == -2 && session[:giro_usuario].to_i == -2 
 		next_restriction
 	else
 		next_val
 	end
 end

 def save_advance(actual, clicked)
 	case actual.to_i
	 	when 1
	 		case clicked.to_i
		 		when 1
		 			session[:has_bussine] = true
		 		when 2
		 			session[:has_bussine] = false
		 		when 3
		 			session[:has_bussine] = false
		 	else
				session[:has_bussine] = false
	 		end
	 	when 2
	 		case clicked.to_i
		 		when 1..5
					session[:giro_usuario] = -2
		 		when 6
		 			session[:giro_usuario] = 0
		 		when 7
		 			session[:giro_usuario] = 0
		 	else
		 		session[:giro_usuario] = 0
	 		end

	 	when 3

	 	when 4

	 	when 5

	 	when 6

	else
 	
 	end
 end

end
