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
  
  unless params[:pagetown].blank?
    @town_name = params[:pagetown][:city_id]
    @key = params[:pagetown][:key]
    respond_to do |format|
      format.js  {render :layout => false}
    end
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
 	if restriction.to_i == -20 && session[:uso_de_suelo]
 		next_restriction
 	else
 		next_val
 	end
 end

     
  #guarda los valores clickeados por el momento en la session del usuario
  def save_advance(actual, clicked) 
    case actual.to_i
      when 1#pregunta 1
        case clicked.to_i
          when 1
            session[:type_zoning] = -1
          when 2..4
            session[:type_zoning] = -2
          when 5
            session[:type_zoning] = -5
          when 6
            session[:type_zoning] = -4
        else
          session[:type_zoning] = -4
        end
      when 2#pregunta 2
        case clicked.to_i
          when 1
            session[:type_zoning] = -10
          when 2
            session[:type_zoning] = -11
          when 3
            session[:type_zoning] = -4
        else
          session[:type_zoning] = -4
        end
      when 5#pregunta 5
        case clicked.to_i
          when 1
            session[:has_zoning] = -12
          when 2
            session[:has_zoning] = -13
          when 3
            session[:has_zoning] = -4
        else
          session[:has_zoning] = -4
        end
      when 7#pregunta 7
        case clicked.to_i
          when 1
            session[:has_zoning] = -21
          when 2..4
            session[:has_zoning] = -22
          when 5
            session[:has_zoning] = -4
        else
          session[:has_zoning] = -4
        end

    else
    
    end
  end

    #guarda los valores clickeados por el momento en la session del usuario
  def save_advance_rank(actual, clicked, date)
   case actual.to_i
      when 3 #pregunta 3
        case clicked.to_i
          when 2
            session[:size_house] = 0
        else
          session[:size_house] = date
        end
      when 4 #pregunta 4
        case clicked.to_i
          when 2
            session[:size_business] = 0
        else
          session[:size_business] = date
          validate_not_zoning
        end
      when 6 #pregunta 6
        case clicked.to_i
          when 2
            session[:date_zoning] = 0
        else
          session[:date_zoning] = date
        end
      when 8 #pregunta 8
        case clicked.to_i
          when 2
            session[:city_zoning] = 0
        else
          session[:city_zoning] = date
          @lugar = date
        end
      
      when 9 #pregunta 9
        case clicked.to_i
          when 2
            session[:town_business] = 0
        else
          session[:town_business] = date
        end
    else
    
    end
  end


  def validate_not_zoning
    unless session[:size_house].nil? || session[:size_house].to_i == 0
      business = session[:size_business].to_i
      house = session[:size_house].to_i
      if (business*100)/house <=20
       session[:uso_de_suelo] = true
      else
        session[:uso_de_suelo] = false
      end
    end
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

  @array_line=[]
  @array_id=[]
  @lugar= ""

  

  @impacto_usuario =  session[:impacto_usuario]
 end


end
